#!/bin/bash

rm -rf ./tempdir

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir/
cp requirements.txt tempdir/
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python:3" >> tempdir/Dockerfile

echo "WORKDIR /home/myapp" >> tempdir/Dockerfile

echo "COPY requirements.txt ./" >> tempdir/Dockerfile

echo "COPY ./static ./static/" >> tempdir/Dockerfile
echo "COPY ./templates ./templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py ./" >> tempdir/Dockerfile

echo "RUN pip install --no-cache-dir -r requirements.txt" >> tempdir/Dockerfile

echo "EXPOSE 5050" >> tempdir/Dockerfile

echo "CMD python ./sample_app.py" >> tempdir/Dockerfile

cd tempdir

docker build -t ejemplo .

docker run -t -d -p 7070:5050 --name ejemplo2 ejemplo

docker ps -a