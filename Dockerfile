FROM alpine:latest AS CLONE_CODE
# Utilizando fork próprio para aceitar configurações do servidor SMTP em tempo de execução
# Já foi enviado um pull request para que essas alterações sejam integradas na versão oficial
ARG FORPDI_REPO_URL=https://github.com/arturluizbr/forpdi.git
ARG FORPDI_REPO_BRANCH=systemprop
#ARG FORPDI_REPO_URL=https://github.com/forpdi/forpdi.git
#ARG FORPDI_REPO_BRANCH=master
RUN apk add --update-cache --no-cache git
RUN git clone --depth 1 $FORPDI_REPO_URL /forpdi -b $FORPDI_REPO_BRANCH

FROM node:6-alpine AS BUILD_FRONTEND
COPY --from=CLONE_CODE /forpdi /forpdi
WORKDIR /forpdi/backend-java/src/main/frontend/
RUN npm -g install webpack
RUN npm install
RUN npm run build

FROM maven:3-jdk-8-alpine AS BUILD_BACKEND
COPY --from=BUILD_FRONTEND /forpdi /forpdi
WORKDIR /forpdi/backend-java/
RUN cp dev.properties prd.properties
RUN sed -i 's/.*connection\.url.*/<!--&-->/' src/main/resources/hibernate.cfg.xml \
 && sed -i 's/.*connection\.username.*/<!--&-->/' src/main/resources/hibernate.cfg.xml \
 && sed -i 's/.*connection\.password.*/<!--&-->/' src/main/resources/hibernate.cfg.xml
RUN mvn install -P prd -B -q
COPY entrypoint.sh /deploy/entrypoint.sh
RUN cp /forpdi/backend-java/target/forpdi.war /deploy \
 && chmod +x /deploy/entrypoint.sh

FROM jboss/wildfly:9.0.2.Final
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="ForPDI Docker" \
      org.label-schema.description="Solução Aberta para elaboração e gestão do PDI" \
      org.label-schema.url="http://www.forpdi.org/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/forpdi/forpdi" \
      org.label-schema.vendor="Artur Oliveira" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
COPY --from=BUILD_BACKEND /deploy /opt/jboss/wildfly/standalone/deployments/
ENTRYPOINT ["/opt/jboss/wildfly/standalone/deployments/entrypoint.sh"]
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-P", "forpdi.properties"]