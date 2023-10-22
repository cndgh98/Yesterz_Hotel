# Yesterz Hotel Booking
- 원본 코드 : [원본 Github 바로가기](https://github.com/Blackbackofficial/Hotel-Booking)
- 코드 사용 목적 : 본 프로젝트는 경기도 일자리 재단에서 진행한 '클라우드 운영 전무가' 교육 과정에서 AWS 설계프로젝트에 사용을 위해서 수정된 코드입니다. 

## 서비스 설명


해당 브런치는 각 서비스를 도커 단위로 실행하기 위해 설정되어 있습니다.
### 서비스 구동 방식
#### 1. 데이터 베이스 실행
- 위치 : 프로젝트 폴더
````
docker compose up
````
- docker-compose.yml
````
version: '3.7'
services:
  db:
    image: postgres
    volumes:
      - ./data/db:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=booking
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password123!
    ports:
      - '5432:5432'
````
- postgres 데이터 베이스 생성
````
- POSTGRES_DB=booking
- POSTGRES_USER=postgres
- POSTGRES_PASSWORD=password123!
````
- 해당 데이터 베이스의 초기 유저 및 비밀번호 지정합니다.
- 데이터베이스 종류 및 포트, 유저, 비밀번호 변경 시 docker-compose.yml 파일 변경하세요,

#### 2. 각 서비스 실행
- 위치 : 프로젝트 폴더
````
./bulid_and_run.sh
````
- 각 서비스 폴더에 Dockerfile을 한번에 빌드하기 위해서 작성한 쉘 스크립트입니다.
- local PC 1대에서 진행할 경우 각 서비스는 지정 포트를 통해서 통신한다
- bulid_and_run.sh
````
# to the desired values
NEW_DB_HOST="ec2-3-38-173-94.ap-northeast-2.compute.amazonaws.com"
NEW_HOST_ADDRESS="ec2-3-38-173-94.ap-northeast-2.compute.amazonaws.com"
````
- 해당 변수를 통해서 각 서비스의 IP 주소 및 DB 주소를 각 Docker에 지정한다.
- ./Bocking_Serveice/Dockerfile
````
# Database and related environment variables
ENV DB_ENGINE=django.db.backends.postgresql_psycopg2
ENV DB_NAME=booking
ENV DB_USER=postgres
ENV DB_PASSWORD=password123!
ENV DB_HOST=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com
ENV HOST_ADDRESS=ec2-43-202-110-191.ap-northeast-2.compute.amazonaws.com
ENV DB_PORT=5432
````
- 해당 내용을 통해서 서비스 내부의 코드에서 변수를 받아서 설정합니다.
- ex) ./Bocking_Serveice/booking_Service/settings.py
````
DATABASES = {
    'default': {
        'ENGINE': os.environ.get('DB_ENGINE'),
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': os.environ.get('DB_PORT'),
    }
}
````
- 다른 서비스도 동일하게 설정되어 있습니다.
#### 3. 프로젝트 종료
- 위치 : 프로젝트 폴더
````
./End_Docker.sh
docker compose down
````

#### 서비스 포트 번호
````
- loyalty : 8000
- session : 8001
- payment : 8002
- booking : 8003
- hotel : 8004
- Gateway : 8005
- Report : 8006
- Rating : 8007
````
---------------
문의 사항 : cndgh98@naver.com 
