FROM node:18-alpine as builder

# 컨테이너 안에서 작업실로 사용할 폴더
WORKDIR /app

# package.json 먼저 복사 후 현재 도커 파일 위치로 이동
COPY package.json package-lock.json ./
RUN npm install

# 현재 폴더에서 작업 폴더로 나머지 파일 이동
COPY . .

RUN npm run build

FROM nginx:alpine
# nginx폴더로 파일 옮기기
COPY --from=builder /app/build /usr/share/nginx/html