
#DockerHubやNvidiaGpuCloudにあるイメージを動かすシェルスクリプト
#各オプションの意味についてはhttps://docs.docker.jp/engine/reference/run.html

docker run --gpus=all -it --ipc=host \
           -v YOUR_HOST_DIR:YOUR_CONTAINER_DIR \
           --name=YOUR_CONTAINER_NAME \
           YOUR_IMAGE_NAME

#コマンドの一例
#docker run --gpus=all -it --ipc=host \         #この行のオプションはおまじない
#           -v ~/Hayakawa:/home/Hayakawa \      #コンテナ側ディレクトリ/home/Hayakawaの中身をホスト側ディレクトリ~/Hayakawaに結びつける（データは全てここに保存するべし）
#           -v ~/Dataset:/home/Dataset \        #複数のディレクトリも結びつけ（マウント）可
#           --name=hykw_torch_1.5_cuda10.2 \    #コンテナにhykw_torch_1.5_cuda10.2という名前をつける
#           nvcr.io/nvidia/pytorch:20.03-py3    #NvidiaGpuCloudにあるnvidia/pytorch:20.03-py3イメージでコンテナを作る
