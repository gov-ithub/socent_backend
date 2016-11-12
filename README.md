# Registrul Unic de Evidenta a Intreprinderilor Sociale - BackEnd

# Instalare

Aplicația se conectează la o bază de date [PostgreSQL](https://www.postgresql.org/download/).
Fișierul `.env.sample` conține un exemplu de configurare. El trebuie redenumit in `.env`
```
cp .env.sample .env
```
Presupunând că postgresql e instalat, și userul `postgres` există, e nevoie de un user specific aplicației.

```
sudo -u postgres createuser -s -P socent # Introdu parola 'socent'
```
Apoi inițializează baza de date
```
rails db:setup
```

**Made with :heart: by [GovITHub](http://ithub.gov.ro)**
