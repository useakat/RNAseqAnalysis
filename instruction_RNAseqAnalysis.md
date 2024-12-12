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

