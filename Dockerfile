# Zugrundeliegendes Image
FROM python:3.9-slim-buster
# Any working directory can be chosen as per choice like '/' or '/home' etc
WORKDIR /app
# Kopieren des aktuellen Verzeichnisses in /app
ADD . /app
# Installieren der requirements.txt
RUN pip install -r requirements.txt
# Port 80 veröffentlichen
# EXPOSE 80

CMD ["python", "AutoStundenBerechnung.py"]