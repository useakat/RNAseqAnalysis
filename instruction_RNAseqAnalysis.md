## 解析環境構築
### Salmon のインストール
```bash
wget https://github.com/COMBINE-lab/salmon/releases/download/v1.9.0/salmon-1.9.0_linux_x86_64.tar.gz -P tools && tar -zxvf tools/salmon-1.9.0_linux_x86_64.tar.gz -C tools
```

### Kallisto のインストール
```bash
wget https://github.com/pachterlab/kallisto/releases/download/v0.48.0/kallisto_linux-v0.48.0.tar.gz -P tools && tar -zxvf tools/kallisto_linux-v0.48.0.tar.gz -C tools
```

## RNA-Seq データからの転写産物ごとの発現量の定量化
### リファレンストランスクリプトームのダウンロード
  GENCODE Human Release42 からヒトのリファレンストランスクリプトームデータを入手する
  ```bash
  sudo wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_42/gencode.v42.transcripts.fa.gz -P <保存先のパス>
  ```

### テストデータのダウンロード（テストデータを使う場合）
  例えば、Universal Human Reference RNAデータ（SRP076615）を ENA から入手する
  ```bash
  srrs=({77..92})
  for srr in ${srrs[@]};do
  url="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR367/00"${srr:1:1}"/SRR36709"${srr}"/SRR36709"${srr}".fastq.gz"
  sudo wget $url -P <保存先のパス>
  done
  ```
### インデックスの作成
  リファレンストランスクリプトームのインデックスを作成する
  ```bash
  tools/salmon-1.9.0_linux_x86_64/bin/salmon index -t <保存先のパス>/gencode.v42.transcripts.fa.gz -i <保存先のパス>/transcripts_index_salmon -k 31
  ```

### 定量化
  作成したインデックスを元に、FASTQデータの定量化を行う
  ```bash
  srrs=({77..92})
  for srr in ${srrs[@]};do
  > mkdir -p analysis/salmon/SRR36709${srr}
  > tools/salmon-1.9.0_linux_x86_64/bin/salmon quant -i <保存先のパス>/transcripts_index_salmon -p 4 -l A -r <保存先のパス>/SRR36709${srr}.fastq.gz -o analysis/salmon/SRR36709${srr}
  > done
  ```
