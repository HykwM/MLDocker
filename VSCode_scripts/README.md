# Docker with Visual Studio Code

Windows版VSCodeでリモートDockerホストを操作する手順を示します。
## Usage

0. Dockerホストでsudoなしでdockerコマンドが使えるようにする。
  
  具体的にはシェルで『sudo gpasswd -a $USER docker』を実行したあと、再起動。

1. https://docs.docker.com/toolbox/toolbox_install_windows/
  
   のステップ2のみを実行し、Dockerクライアント(Windows機)にDockerToolBoxをインストールする。
  
   ※DockerDesktopやDockerCLI導入済みの場合はスキップ可
  

2. Dockerクライアントから公開鍵認証でDockerホストにSSH接続できるように準備する。 
  
    ※これらの手順は以前実行済みならスキップできます。
  
    2-1. Windows Power Shellもしくはコマンドプロンプトで『ssh-keygen』コマンドを実行（質問攻めにあうが全てEnterでOK）

	2-2. このディレクトリにあるenable_sshagent.batを「管理者で実行」する。
  
    2-3. このディレクトリにあるssh-copy-id.ps1をPATHの通った場所（面倒くさければC\WINDOWS）におく。
  
3. Windows Power Shell で 以下のコマンドを実行し、Dockerホストに公開鍵を送り付ける。

```
     PowerShell -ExecutionPolicy RemoteSigned ssh-copy-id.ps1 [リモートユーザー名] [リモートホスト名]
```
    
4. VSCodeに拡張機能『Docker』および『Remote-Containers』をインストールする。
  
5. 左下の歯車 → 『設定』→ 画面中央上の検索窓に『docker.host』と入力し設定項目を検索。

6. 『Docker:Host』設定項目にDockerホストの情報を入力。
	例）Dockerホストがユーザー名『user』ホスト名『host』を持つ場合『ssh://user@host』と入力

7. 左端のクジラアイコンをクリックで表示される稼働中コンテナを右クリック→『Attach Visual Studio Code』

8. Enjoy!


（参考：https://code.visualstudio.com/docs/containers/ssh
  https://qiita.com/tabu_ichi2/items/446722c15e6b5678ccad）

## Requirement

以下の環境で動作を確認しています。

Dockerホスト：Docker CE 19.03がインストールされたUbuntu 16.04 および 18.04

Dockerクライアント： Windows 10 ビルド1803以降 