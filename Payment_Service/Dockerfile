# pull official base image
FROM python:3.9

WORKDIR /usr/src/Payment_Service
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
# copy project
COPY . .
# Database and related environment variables
ENV DB_ENGINE=django.db.backends.postgresql_psycopg2
ENV DB_NAME=change-db-name
ENV DB_USER=change-db-user
# 아래 비밀번호는 예시이며 실제 사용시 외부에서 관리하는 것이 좋습니다.
ENV DB_PASSWORD=change-db-password
ENV DB_HOST=change-db-host
ENV HOST_ADDRESS=change-host-address
ENV DB_PORT=5432

# Expose the port the app runs on
EXPOSE 8002

# Command to run on container start
CMD ["sh", "-c", "python3.9 manage.py runserver 0.0.0.0:8002"]