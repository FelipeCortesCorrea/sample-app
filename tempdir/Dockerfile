FROM python:3
WORKDIR /home/myapp
COPY requirements.txt ./
COPY ./static ./static/
COPY ./templates ./templates/
COPY sample_app.py ./
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5050
CMD python ./sample_app.py
