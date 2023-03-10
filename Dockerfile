FROM python:3.11
WORKDIR /home/
ADD requirements.txt requirements.txt
ADD start.sh start.sh
RUN chmod +x start.sh
RUN apt-get update && apt-get -y install gcc cmake git pkg-config
RUN pip install -r requirements.txt
RUN pip install torch --extra-index-url https://download.pytorch.org/whl/cpu

COPY app/ app/

EXPOSE 8000/tcp