# yesterz Hotel Booking
## 서비스 구동 방식
- Hotel-Booking 폴더 내에서 docker compose up
- 포트 변경 시 docker-compose.yml 파일 변경
- 실행할 서비스 필요 시 추가
## DB 구성 및 연결
- DB 구축 (PostgreSQL) 
- 각 서비스에서 setting.py에 데이터베이스 정보 수정

## 서비스 포트 번호
- loyalty : 8000
- session : 8001
- payment : 8002
- booking : 8003
- hotel : 8004
- Gateway : 8005
- Report : 8006
- Rating : 8007