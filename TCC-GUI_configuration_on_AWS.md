## login to AWS

## launch an instance in EC2
ubuntu 22

## configure the instance
root で作業する。```sudo su -```

1. configure Ubuntu
    ```bash
    sudo apt update
    ```

2. install latest R
    ```bash
    export R_VERSION=4.3.3
    curl -O https://cdn.rstudio.com/r/ubuntu-2204/pkgs/r-${R_VERSION}_1_amd64.deb
    sudo gdebi r-${R_VERSION}_1_amd64.deb
    sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R
    sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
    ```

3. install libssl
    ```bash
    wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
    sudo dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.
    ```

4. install Rstudio
    ```bash
    sudo apt-get install gdebi-core
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.1-554-amd64.deb
    sudo gdebi rstudio-server-2022.07.1-554-amd64.deb
    ```
    (Rstudio server のアンインストール: ```sudo apt-get remove --purge rstudio-server```        )

5. set a port for Rstudio
    /etc/rstudio/rserver.conf の１行目に www-port=1234 (1234は好きなポート番号）と追加する
    ```bash
    sudo systemctl restart rstudio-server.service
    ```

6. ユーザーパスワードの設定
    ```bash
    sudo passwd <ユーザー名>
    ```

## インストール libcurl
    ```bash
    sudo apt install libcurl4-openssl-dev
    ```

## TCC-GUI のインストール
  ```bash
  git clone https://github.com/swsoyee/TCC-GUI.git ~/TCC-GUI
  login to Rstudio-server with IPaddress:ポート番号
  double click TCC-GUI.Rproj in TCC-GUI folder
  install BiocManager (v3.19 for R 4.4.0)
  if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  BiocManager::install(version = "3.19") 
  renv::restore()
  ```
