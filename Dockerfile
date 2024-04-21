FROM ubuntu:latest

# 必要なツールのインストール
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    r-base \
    wget

# RStudio Server のダウンロードとインストール
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1106-amd64.deb \
    && gdebi --n rstudio-server-1.4.1106-amd64.deb

# RStudio Server の設定
EXPOSE 8787

# 環境設定
ENV USER rstudio
RUN adduser --disabled-password --gecos "" $USER
