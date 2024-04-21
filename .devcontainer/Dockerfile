FROM ubuntu:latest

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    tzdata \
    sudo \
    gdebi-core \
    r-base \
    wget

# RStudio Server のダウンロードとインストール
#RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1106-amd64.deb \
#    && gdebi --n rstudio-server-1.4.1106-amd64.deb

RUN wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb \
    && gdebi --n rstudio-server-1.1.453-amd64.deb

# RStudio Server の設定
EXPOSE 8787

# 環境設定
ENV USER=rstudio \
    PASSWORD=rstudio

RUN adduser --disabled-password --gecos "" $USER \
    && echo "$USER:$PASSWORD" | chpasswd

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata
