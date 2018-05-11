# ForPDI

[![](https://images.microbadger.com/badges/image/arturluizbr/forpdi.svg)](http://microbadger.com/images/arturluizbr/forpdi)



O **ForPDI** é a plataforma aberta para gestão e acompanhamento do Plano de Desenvolvimento Institucional - PDI de universidades federais e outras instituições públicas. O ForPDI surgiu da necessidade de uma ferramenta de acompanhamento do PDI em tempo real, de forma colaborativa, eficiente, rápida e segura.

## Compose
Para iniciar o serviço rapidamente pelo Docker Compose, utilize o seguinte arquivo:
```yaml
version: "3.3"
services:
  forpdi:
    image: arturluizbr/forpdi
    environment:
    - DB_HOST=mysql
    - DB_PORT=3306
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

Segue as configurações disponíveis:

### Implementadas
- DB_HOST: Configura o Host do Banco Mysql. Valor padrão: mysql
- DB_PORT: X. Valor padrão: 3306
- DB_NAME: X. Valor padrão: forpdi
- DB_USERNAME: X. Valor padrão: forpdi
- DB_PASSWORD: X. Valor padrão: forpdi

### Não Implementadas
- MAIL_SMTP_FROM_NAME: X. Valor padrão: ForPDI
- MAIL_SMTP_FROM_EMAIL: X. Valor padrão: forpdi@gmail.com
- MAIL_SMTP_URL: X. Valor padrão: smtp.gmail.com
- MAIL_SMTP_PORT: X. Valor padrão: 587
- MAIL_SMTP_USERNAME: X. Valor padrão: forpdi
- MAIL_SMTP_PASSWORD: X. Valor padrão: forpdi
- MAIL_SMTP_SSL: X. Valor padrão: false
- MAIL_SMTP_TLS: X. Valor padrão: false