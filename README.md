# ForPDI

![Docker Stars](https://img.shields.io/docker/stars/arturluizbr/forpdi.svg?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/arturluizbr/forpdi.svg?style=flat-square)

![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/arturluizbr/forpdi.svg?style=flat-square)
![MicroBadger Layers](https://img.shields.io/microbadger/layers/arturluizbr/forpdi.svg?style=flat-square)

![Docker Automated build](https://img.shields.io/docker/automated/arturluizbr/forpdi.svg?style=flat-square)
![Docker Build Status](https://img.shields.io/docker/build/arturluizbr/forpdi.svg?style=flat-square)

O **ForPDI** é a plataforma aberta para gestão e acompanhamento do Plano de Desenvolvimento Institucional - PDI de universidades federais e outras instituições públicas. O ForPDI surgiu da necessidade de uma ferramenta de acompanhamento do PDI em tempo real, de forma colaborativa, eficiente, rápida e segura.

## Compose
Para iniciar o serviço rapidamente pelo Docker Compose, utilize o seguinte arquivo:

```
version: "3.3"
services:
  forpdi:
    image: arturluizbr/forpdi
    environment:
    - DB_HOST=mysql
    - DB_NAME=forpdi
    - DB_USERNAME=forpdi
    - DB_PASSWORD=forpdi
    ports:
    - 8080:8080
  mysql:
    image: mysql
    environment:
    - MYSQL_ROOT_PASSWORD=forpdi
    - MYSQL_DATABASE=forpdi
    - MYSQL_USER=forpdi
    - MYSQL_PASSWORD=forpdi
    volumes:
    - ./mysqldata:/var/lib/mysql
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