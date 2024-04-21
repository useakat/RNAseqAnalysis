# ベースイメージ
FROM ubuntu:20.04

# 環境変数の設定（インタラクティブな選択をスキップするため）
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージのインストール
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

# タイムゾーン設定
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

# ユーザーの設定
ENV USER=rstudio
RUN adduser --disabled-password --gecos "" $USER
RUN echo "$USER:$USER" | chpasswd

CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize=0", "--auth-none=1"]
