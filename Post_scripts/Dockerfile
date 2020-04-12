FROM YOUR_IMAGE_NAME AS BASE

# Install Ubuntu software
RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list
RUN echo 'path-include=/usr/share/locale/ja/LC_MESSAGES/*.mo' > /etc/dpkg/dpkg.cfg.d/includes \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
    tzdata \
    x11-apps \
    language-pack-ja-base \
    language-pack-ja \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/*

# Set locale
RUN locale-gen ja_JP.UTF-8 en_US.UTF-8 \
    && echo 'LC_ALL=ja_JP.UTF-8' > /etc/default/locale \
    && echo 'LANG=ja_JP.UTF-8' >> /etc/default/locale
ENV LANG=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:ja \
    LC_ALL=ja_JP.UTF-8 \
    TZ=Asia/Tokyo

# Set X11 env
ENV QT_X11_NO_MITSHM=1 \
    HOME=/tmp \
    XAUTHORITY=/home/hostuser/.Xauthority

# Install python library
RUN pip install autopep8

# Fix sudo
RUN echo 'Defaults env_keep += "PATH"' >> /etc/sudoers \
    && sed -i "/secure_path/d" /etc/sudoers