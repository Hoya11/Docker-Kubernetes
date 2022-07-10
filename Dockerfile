FROM node

# 도커에게 모든 후속 명령이 그 폴더 내부에서 실행됨을 알림
WORKDIR /app

COPY package.json /app

RUN npm install

# './'은 도커 컨테이너의 현재 작업 디렉토리를 의미함
# (작업 디렉토리를 /app으로 설정했기 때문에 RUN뿐만 아니라 COPY도 작업 디렉토리로 지정)
COPY . /app

EXPOSE 80

#RUN과의 차이는 이미지가 생성될 때 실행되지 않고 이미지를 기반으로 컨테이너가 시작될 때 실행됨
# 도커에게 이미지를 기반으로 컨테이너가 생성될 때마다 그 컨테이너 내부에 있는 node 명령을 사용하여
# server.js 파일을 실행하도록 지시함(CMD에 특정하지 않으면 베이스 이미지가 실행되며, 그게 없는 경우 에러 발생)
CMD ["node", "server.js"]