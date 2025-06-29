# Secrets

## Certs

From repo root:

```sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout .env/secrets/certs/cert.pem -out cert.pem
```

```sh
openssl x509 -in .env/secrets/certs/cert.pem -out .env/secrets/certs/common.cert
```

