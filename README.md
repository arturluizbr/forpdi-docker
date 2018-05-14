# ForPDI

[![](https://images.microbadger.com/badges/image/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/arturluizbr/forpdi.svg)](https://microbadger.com/images/arturluizbr/forpdi "Get your own commit badge on microbadger.com")

O **ForPDI** é a plataforma aberta para gestão e acompanhamento do Plano de Desenvolvimento Institucional - PDI de universidades federais e outras instituições públicas. O ForPDI surgiu da necessidade de uma ferramenta de acompanhamento do PDI em tempo real, de forma colaborativa, eficiente, rápida e segura.

## Compose
Para iniciar o serviço rapidamente pelo Docker Compose, utilize o seguinte arquivo:

```
version: "3.6"
services:
  forpdi:
    build: .
    environment:
    - DB_HOST=mysql
    - DB_PORT=3306
    - DB_NAME=forpdi
    - DB_USERNAME=forpdi
    - DB_PASSWORD=forpdi
    ports:
    - 8181:8080
    depends_on:
    - mysql
  mysql:
    image: mysql
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


## Configurações

### Implementadas
- DB_HOST: Host do Banco MySQL. *(Padrão: mysql)*
- DB_PORT: Porta do Banco MySQL. *(Padrão: 3306)*
- DB_NAME: Nome da base no Banco MySQL. *(Padrão: forpdi)*
- DB_USERNAME: Nome de usuário no Banco MySQL. *(Padrão: forpdi)*
- DB_PASSWORD: Senha do usuário no Banco MySQL. *(Padrão: forpdi)*

### Não Implementadas
- MAIL_SMTP_FROM_NAME: X. Valor padrão: ForPDI
- MAIL_SMTP_FROM_EMAIL: X. Valor padrão: forpdi@gmail.com
- MAIL_SMTP_URL: X. Valor padrão: smtp.gmail.com
- MAIL_SMTP_PORT: X. Valor padrão: 587
- MAIL_SMTP_USERNAME: X. Valor padrão: forpdi
- MAIL_SMTP_PASSWORD: X. Valor padrão: forpdi
- MAIL_SMTP_SSL: X. Valor padrão: false
- MAIL_SMTP_TLS: X. Valor padrão: false