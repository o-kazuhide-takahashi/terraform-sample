# terraform-sample - AWS向けのTerrafomサンプル

---

## 事前準備 terraformのインストール

### Linux (CentOS 7.1)

- 前提条件
  - centosユーザーでログインしている
  - TerraformのダウンロードURL https://www.terraform.io/downloads.html

- Terraformのインストール
  ```
  cd ~
  wget https://releases.hashicorp.com/terraform/0.7.11/terraform_0.7.11_linux_amd64.zip
  unzip terraform_0.7.11_linux_amd64.zip # 1ファイル(terraform)が出てくる
  sudo mv terraform /bin # PATHが通っている/binに配置
  ```
- aws-cli のインストール (同時にやっておくと便利です)
  ```
  sudo yum -y install python-setuptools
  sudo easy_install pip
  sudo pip install awscli

  ```
- aws cli のテスト
  ```
  # IAM認証のための設定をexportしておく
  export AWS_ACCESS_KEY_ID="AKIAxxxx"
  export AWS_SECRET_ACCESS_KEY="xxxxxxxx"
  export AWS_DEFAULT_REGION="ap-northeast-1" # tokyo
  # テスト実行 (s3 バケット一覧の取得)
  aws s3 ls
  ```

## 使い方

- 事前に必ずtfファイルのあるディレクトリにcdで移動する
  ```
  cd aws-simple
  ```

- 確認(Dry-Run)
  ```
  terraform plan
  ```

- 実行(Apply)
  ```
  terraform apply
  ```

- すべての削除 (テスト時などに使う想定)
  ```
  terraform destroy # 確認時にはyesと入力で削除開始
  ```

## サンプル

### aws-simple

- 概要
  - Terraformのシンプルなサンプル
    - VPCとサブネットとインターネットアクセスに必要な設定の作成
    - EC2のインスタンス(webサーバに見立てた設定)の作成、S3などにアクセスできるロールの設定
    - S3バケットの作成
