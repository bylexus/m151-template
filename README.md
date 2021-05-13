M151 - DB in Web-Applikation einbinden - Bootstrap-Repository
==============================================================

Dieses Repository dient als Startpunkt für das Modul M151 - DB in Web-Applikation einbinden.

Es definiert die für die Schüler-Infrastruktur notwendigen Dienste (Docker-Container, siehe `docker-compose.yml).

## Benutzung mit docker:

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

## Benutzung mit Vagrant:

Die Vagrant-Konfiguration erlaubt das einfache Provisionieren einer VirtualBox-Linux-VM, welches docker zur Verfügung stellt:
somit muss Docker nicht lokal installiert werden.

Dazu muss erst [ VirtualBox ](https://www.virtualbox.org/) und [ Vagrant ](https://www.vagrantup.com/) installiert werden

**Erstellen/Starten der VM:**

``shell
$ cd /pfad/zum/git-/repo
$ vagrant up
```

**Stoppen der VM:**

``shell
$ cd /pfad/zum/git-/repo
$ vagrant halt
```

**SSH-Verbindung in die VM:**

```shell
$ cd /pfad/zum/git-/repo
$ vagrant ssh
```

**Docker in der VM administrieren:**

```shell
$ cd /pfad/zum/git-/repo
$ vagrant ssh
# Beispiele:
(ssh) $ docker ps
(ssh) $ docker exec -ti m151-web bash
(ssh) $ docker exec -ti m151-web composer dump-autoload
```

(c) Alexander Schenkel, alex@alexi.ch
