# Datencockpit (Docker)
Dockerversion von Datencockpit (www.datencockpit.at)

# Installation

1) git, docker & docker-compose installieren
2) git clone https://github.com/soudis/datencockpit-docker.git /zielordner
3) docker-compose.yml.sample anpassen (Seitenname, DB Passwörter, URL, contact E-Mail) und als docker-compose.yml speichern
4) docker-compose build
5) docker-compose up -d

warten bis Seite angezeigt wird (ein paar Minuten)

6) docker-compose exec datencockpit ./update.sh
