FROM alpine:latest AS CLONE_CODE
RUN apk add --update-cache --no-cache git
RUN git clone https://github.com/forpdi/forpdi.git /forpdi

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
RUN mvn dependency:go-offline -P prd
RUN sed -i 's/.*connection\.url.*/<!--&-->/' src/main/resources/hibernate.cfg.xml \
 && sed -i 's/.*connection\.username.*/<!--&-->/' src/main/resources/hibernate.cfg.xml \
 && sed -i 's/.*connection\.password.*/<!--&-->/' src/main/resources/hibernate.cfg.xml
RUN mvn install -P prd

FROM jboss/wildfly:9.0.2.Final
COPY --from=BUILD_BACKEND /forpdi/backend-java/target/forpdi.war /opt/jboss/wildfly/standalone/deployments/
COPY entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-P", "forpdi.properties"]