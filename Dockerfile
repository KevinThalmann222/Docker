# Zugrundeliegendes Image von Dockerhub
# Hier wird Python installiert
FROM python:3.9
# Hinzufügen aller Datein
ADD . /app
WORKDIR /app
# ---------------------------------------
# Hinzufügen von AutoStundenBerechnung.py
# ADD AutoStundenBerechnung.py .
# Hinzufügen von requirements.txt
# ADD requirements.txt .
# ---------------------------------------
# Installieren der requirements.txt
RUN pip install -r requirements.txt
# Port 80 veröffentlichen
# EXPOSE 80

CMD ["python", "AutoStundenBerechnung.py"]