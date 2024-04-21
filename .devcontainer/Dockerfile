FROM rocker/rstudio:latest

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y sudo

# rstudio ユーザーに sudo 権限を付与
RUN echo "rstudio ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# 追加の R パッケージをインストールする場合
RUN R -e "install.packages(c('ggplot2', 'dplyr'), repos='http://cran.rstudio.com/')"

# 任意のその他の設定
