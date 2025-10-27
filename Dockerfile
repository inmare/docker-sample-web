FROM node:18-alpine as builder

# 컨테이너 안에서 작업실로 사용할 폴더
WORKDIR /app

# package.json 먼저 복사 후 현재 도커 파일 위치로 이동
COPY package.json package-lock.json ./
RUN npm install

# 현재 폴더에서 작업 폴더로 나머지 파일 이동
COPY . .

RUN npm run build

# nginx컨테이너 생성
FROM nginx:alpine
# nginx폴더로 dist의 파일만 옮기기
COPY --from=builder /app/dist/ /usr/share/nginx/html

# 기본 nginx config 변경
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf