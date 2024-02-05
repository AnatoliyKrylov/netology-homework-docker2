FROM python:3.10

WORKDIR code/

COPY . .

ENV MY_ENV=netology_docker_2

RUN pip install -r requirements.txt

EXPOSE 8000

CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000 && gunicorn smart_home.wsgi -b 0.0.0.0:8000
