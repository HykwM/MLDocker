docker run --gpus=all -it --ipc=host \
           -u $(id -u):$(id -g) -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro \
           --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v $HOME:/home/hostuser:ro --net=host \
           -v YOUR_HOST_DIR:YOUR_CONTAINER_DIR \
           --name=YOUR_CONTAINER_NAME \
           YOUR_IMAGE_NAME