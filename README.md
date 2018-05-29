# ForPDI

[![](https://images.microbadger.com/badges/image/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own commit badge on microbadger.com")

O **ForPDI** é a plataforma aberta para gestão e acompanhamento do Plano de Desenvolvimento Institucional - PDI de universidades federais e outras instituições públicas. O ForPDI surgiu da necessidade de uma ferramenta de acompanhamento do PDI em tempo real, de forma colaborativa, eficiente, rápida e segura.

## INICIANDO SERVIÇO
Para iniciar o serviço rapidamente pelo Docker Compose, utilize o seguinte `docker-compose.yml`:

```
version: "3.6"
services:
  forpdi:
    image: arturluizbr/forpdi
    environment:
    - DB_HOST=mysql
    - DB_PORT=3306
    - DB_NAME=forpdi
    - DB_USERNAME=forpdi
    - DB_PASSWORD=forpdi
    - MAIL_SMTP_FROM_NAME=ForPDI
    - MAIL_SMTP_FROM_EMAIL=naoresponda@meusite.com.br
    - MAIL_SMTP_URL=smtp-relay.gmail.com
    - MAIL_SMTP_PORT=25
    - MAIL_SMTP_USERNAME=
    - MAIL_SMTP_PASSWORD=
    - MAIL_SMTP_SSL=false
    - MAIL_SMTP_TLS=false
    ports:
    - 8181:8080
    depends_on:
    - mysql
  mysql:
    image: mysql:5.7
    environment:
    - MYSQL_ROOT_PASSWORD=forpdi
    - MYSQL_DATABASE=forpdi
    - MYSQL_USER=forpdi
    - MYSQL_PASSWORD=forpdi
    volumes:
    - mysqldata:/var/lib/mysql
volumes:
  mysqldata:
```


## CONFIGURANDO SERVIÇO

### Banco de Dados
- DB_HOST: Host do Banco MySQL. *(Padrão: mysql)*
- DB_PORT: Porta do Banco MySQL. *(Padrão: 3306)*
- DB_NAME: Nome da base no Banco MySQL. *(Padrão: forpdi)*
- DB_USERNAME: Nome de usuário no Banco MySQL. *(Padrão: forpdi)*
- DB_PASSWORD: Senha do usuário no Banco MySQL. *(Padrão: forpdi)*

### Servidor SMTP
- MAIL_SMTP_FROM_NAME: X. *(Padrão: ForPDI)*
- MAIL_SMTP_FROM_EMAIL: X. *(Padrão: forpdi@gmail.com)*
- MAIL_SMTP_URL: Endereço de conexão com o servidor SMTP. *(Padrão: smtp-relay.gmail.com)*
- MAIL_SMTP_PORT: Porta de conexão com o servidor SMTP. *(Padrão: 25)*
- MAIL_SMTP_USERNAME: Nome de usuário do servidor SMTP.
- MAIL_SMTP_PASSWORD: Senha de usuário do servidor SMTP.
- MAIL_SMTP_SSL: Habilita SSL na conexão com o servidor SMTP. *(Padrão: false)*
- MAIL_SMTP_TLS: Habilita TLS na conexão com o servidor SMTP. *(Padrão: false)*

## UTILIZANDO SERVIÇO

Utilize a documentação oficial do forpdi para mais orientações de como proceder.

- Site Oficial: [forpdi.org](http://www.forpdi.org)
- Manual do Usuário: [forpdi.org/manual.pdf](http://www.forpdi.org/manual.pdf)