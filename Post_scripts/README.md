# Dockerfile and RUN scripts

Dockerfileや『docker run』スクリプトがまとめてあります。

## Usage

### 既存イメージからそのままコンテナを作る
  
1. image_run.shのコマンド末尾3行を適宜編集した後、実行する。

### 既存イメージにDockerfileを適用してコンテナを作る
1. Dockerfileの一行目『YOUR_IMAGE_NAME』を任意のイメージ名に変える。  
  その他、インストールしたいライブラリがあれば適宜追加する。
    
2. シェルを起動し、この『Post_scripts』フォルダをカレントディレクトリとする。  
  
3. 以下のコマンドを実行（※末尾の.を忘れないように）  

```
     sudo docker build -t 『作成後イメージ名』 .
```
    
4. dockerfile_run.shの末尾3行を適宜編集した後、実行する。
