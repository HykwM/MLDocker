docker run --gpus=all -it --ipc=host \
           -v YOUR_HOST_DIR:YOUR_CONTAINER_DIR \
           --name=YOUR_CONTAINER_NAME \
           YOUR_IMAGE_NAME