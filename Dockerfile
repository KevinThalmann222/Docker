# Zugrundeliegendes Image
FROM python:3.9-slim-buster
WORKDIR /app
# Kopieren des aktuellen Verzeichnisses in /app
ADD . /app
# Installieren der requirements.txt
RUN pip install -r requirements.txt
# Port 80 veröffentlichen
EXPOSE 80

CMD ["python", "hello.py"]