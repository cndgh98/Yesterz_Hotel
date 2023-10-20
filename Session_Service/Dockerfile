# pull official base image
FROM python:3.9

WORKDIR /usr/src/Session_Service
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
ENV DB_NAME=booking
ENV DB_USER=postgres
# 아래 비밀번호는 예시이며 실제 사용시 외부에서 관리하는 것이 좋습니다.
ENV DB_PASSWORD=password123!
ENV DB_HOST=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com
ENV HOST_ADDRESS=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com
ENV DB_PORT=5432

# Expose the port the app runs on
EXPOSE 8001

# Command to run on container start
CMD ["sh", "-c", "python3.9 manage.py runserver 0.0.0.0:8001"]