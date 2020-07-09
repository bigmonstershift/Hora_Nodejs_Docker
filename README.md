# 要件定義

- 麻雀の点数計算
- 入力フォームページ/結果出力ページ
- AWSで自動起動
	- CloudFormationでインスタンス,AMI,SGを指定
- １プロセス１コンテナ
	- DB連携

|入力フォームページ|結果出力ページ|
|----|----|
|![inputpage](https://user-images.githubusercontent.com/53789788/87041052-9b6a3580-c22c-11ea-9f82-055657a0cfbc.png)|![resultpage](https://user-images.githubusercontent.com/53789788/87041092-aae97e80-c22c-11ea-87d8-d7cea8c18123.png)|


# AWS操作手順

# テスト用コマンド備忘録
※CloudFormationのUserDataで自動化済み

```
yum -y update; yum -y install git docker; systemctl start docker;
git clone 【リポジトリURL】 ./Hora_Web
cd Hora_Web
docker build -t nodejs .
docker run -itd --name nodejs --privileged -p 3000:3000 nodejs /sbin/init
docker exec nodejs node /myapp/index.js &
```

# 各ファイル備忘録

- index.js
	- NODE.js実行プログラム
- CloudFromation.yml
	- AWSスタック作成用
	- UserDataのシェル実行確認済み
- templates
	- form.ejs
		- index.ejsから呼ばれる
		- 計算ページ
	- calc.ejs
		- form.ejsから呼ばれる
		- 計算処理
