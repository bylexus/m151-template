M151 - DB in Web-Applikation einbinden - Bootstrap-Repository
==============================================================

Dieses Repository dient als Startpunkt für das Modul M151 - DB in Web-Applikation einbinden.

Es definiert die für die Schüler-Infrastruktur notwendigen Dienste (Docker-Container, siehe `docker-compose.yml).

Benutzung:

```
# Starten aller Dienste:
$ docker-compose up

# (optional, da automatisch beim Start) Web-Applikation: Abhängigkeiten und Autoloader konfigurieren:
$ docker exec -ti m151-web composer install
```

Danach stehen folgende Dienste zur Verfügung:

* `m151-web`: http://localhost:8020/webroot/
* `plantuml`: http://localhost:10001/
* `m151-db`: MySQL-Server, Port 3306, user: `m151`, pw: `m151`
* `m151-docsify`: http://localhost:10000/

(c) Alexander Schenkel, alex@alexi.ch
