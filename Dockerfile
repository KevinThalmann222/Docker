# Zugrundeliegendes Image
FROM pyton 3.9 -slim
WORKDIR /test
# Kopieren des aktuellen Verzeichnisses in /app
ADD . /test
# Installieren der requirements.txt
RUN pip install -r requirements.txt
# Port 80 veröffentlichen
EXPOSE 80

CMD ["python", "hello.py"]