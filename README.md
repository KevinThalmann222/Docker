# Docker

Start with Docker

| Command                                                        | Description                                                              |
| -------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `docker info`                                                  | Allgemeine Informationen                                                 |
| `docker pull busybox`                                          | Download images **busybox** von Dockerhub                                |
| `docker run  busybox`                                          | Startet **busybox**                                                      |
| `Docker images`                                                | Welche docker sind gerade am laufen                                      |
| `Docker ps`                                                    | Aller docker                                                             |
| `Docker ps -a`                                                 | Startet "busybox" im interaktiven modus                                  |
| `docker run -it busybox sh`                                    | Startet "busybox" im interaktiven modus                                  |
| `docker run -p 5000:80 nginx`                                  | **-p - Port** frei für den Zugriff **localhost:5000/**                   |
| `docker run -p 5000:80 -d nginx`                               | **-d - Detached** modus-> die Shell muss nicht die ganze Zeit aktiv sein |
| `docker run -p 5000:80 -d  -ti nginx`                          | **-it Zugreifen** mit docker attach {ip} und beenden (strg p, strg q)    |
| `docker attach {ip}`                                           | Anhängen an ein Container                                                |
| `docker run -p 5000:80 -dit  -v {path} nginx`                  | **-v - Volumen** Ordners verlinken                                       |
| `docker run -p 5000:80 -dit  --name  my_image -v {path} nginx` | **--name - Name** Name des Container                                     |
| `docker stop CONTAINER ID`                                     | Stoppen des Containers mit der Docker IP                                 |
| `docker rm CONTAINER ID`                                       | Löschen des Containers mit der Docker IP                                 |
| `docker container prune`                                       | Löschen aller Container (auch inaktive)                                  |
| `docker image rm CONTAINER NAME`                               | Löschen des Images z.B. nginx                                            |
| `docker image prune`                                           | Löschen aller Images (auch inaktive)                                     |
| `docker stats`                                                 | Statistiken der laufenden Container                                      |
| `docker logs CONTAINER ID`                                     | Ausgabe des Logs                                                         |
| `docker inspect -f {{.LogPath}} CONTAINER ID`                  | Wo wird die Log-Datei gespeichert                                        |

**docker run -p 5000:80 -dit --restart unless-stopped --memory=6m --cpus="1.0" --log-driver json-file --log-opt max-size=100m --name my_image -v PATH nginx**

| Command                  | Description 1                  | Description 2                                           |
| ------------------------ | ------------------------------ | ------------------------------------------------------- |
| `-a`                     | Docker ps -a                   | All                                                     |
| `-p`                     | docker run -p 5000:80          | Port                                                    |
| `-d`                     | -                              | Detach                                                  |
| `-v`                     | -v D:\test\02_Python           | Volumen                                                 |
| `-ti`                    | Erneuter Zugriff möglich       | Interactive                                             |
| `-dit`                   | -dit -> -d -i -t.              | interactively & detached                                |
| `--name`                 | Name des Containers            | --name my_image                                         |
| `--restart`              | Docker wird neu gestartet      | -restart=(unless-stopped , always, failure, on-failure) |
| `--memory`               | Limitierung Arbeitsspeicher    | --memory=6m (g = 4gb; m = 4mb )                         |
| `--cpu`                  | Limitierung CPU                | --cpu="1"                                               |
| `--log-driver json-file` | Erstellen einer json Log-Datei |                                                         |
| `--log-opt`              | Logger Optionen                | -log-opt max-size=100m ; -log-opt max-file=10           |
| `--rm`                   | Remove Container               | Container wird nach dem Starten wieder gelöscht         |
| `sleep infinity`         | Container läuft unendlich      |                                                         |

| Dockerfiles builden und starten                              | Description 1        | Description 2            |
| ------------------------------------------------------------ | -------------------- | ------------------------ |
| `docker build -t stunden-tool d:\04_TG-C23\02_Python\Docker` | -t = tag (name)      | Vezeichnis               |
| `docker start --attach KevinsPythonENV`                      | Attach STDOUT/STDERR | Starten eines Containers |
| `docker stop KevinsPythonENV`                                | -                    | Stopeen eines Containers |
| `docker exec -it cd5721742046 sh`                            | ls                   | Wechseln ins Verzeichnis |

| Dockerfiles starten mit mehren Volumes                                                                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `docker run -it -v /d/04_TG-C23/02_Python/Docker_Excellisten:/app/excel -v /d/04_TG-C23/02_Python/Docker_Excellisten/export:/app/deineStunden --name myENV stunden-tool` |

| Images auf Docker Hub hochladen                              | Description 1          |
| ------------------------------------------------------------ | ---------------------- |
| `docker tag stunden-tool kevinthalmann222/stunden-tool:V1.1` | tagen                  |
| `docker push kevinthalmann222/stunden-tool:V1.1`             | upload on docker hub   |
| `docker pull kevinthalmann222/stunden-tool:V1.1`             | download on docker hub |

| Create Container and run it                                   |
| ------------------------------------------------------------- |
| `https://hub.docker.com/r/kevinthalmann222/stunden-tool/tags` |

`docker run -it -v /d/04_TG-C23/02_Python/Docker_Excellisten:/app/excel -v /d/04_TG-C23/02_Python/Docker_Excellisten/export:/app/deineStunden --name myENV kevinthalmann222/stunden-tool:V1.1`

| Run Jenkins in a Docker Container | Description                                 |
| --------------------------------- | ------------------------------------------- |
| `-p 8080:8080`                    | By default runs on that port                |
| `-p 50000:50000`                  | Master / Slave Commnunication               |
| `-d`                              | Detach - Mode                               |
| `--restart=on-failure`            | Docker will be restarted if an error occurs |
| `-v`                              | Volume frome host to the Docker-Image       |
| `--name`                          | The name of the container                   |
| `jenkins/jenkins:lts`             | Downloade Jenkins with the latest version   |

`docker run -p 8080:8080 -p 50000:50000 -d --restart=on-failure -v /d/04_TG-C23/02_Python/Docker/Jenkins:/app/jenkins_home --name myJenkins jenkins/jenkins:lts`

1. `Docker ps` to get the container ID (id)
2. `Docker logs id` to get the passwort
3. `http://localhost:8080/` paste the passwort
