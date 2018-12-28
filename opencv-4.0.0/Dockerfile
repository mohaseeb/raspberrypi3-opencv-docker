FROM resin/raspberrypi3-python:2.7

cwd=$(pwd)

# Install dependencies needed for building and running OpenCV
RUN apt-get update && apt-get install -y --no-install-recommends \
    # to build and install
    unzip \
    build-essential cmake pkg-config \
    checkinstall yasm \
    # to work with images
    libjpeg8-dev libtiff-dev libjasper-dev libpng12-dev \
    libtiff5-dev \
    # to work with videos
    libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
    libxine2-dev libv4l-dev \

RUN cd /usr/include/linux && \
    sudo ln -s -f ../libv4l1-videodev.h videodev.h \
    cd $cwd

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
    # needed by highgui tool
    libgtk2.0-dev \
    libtbb-dev qt5-default \ # ?
    # for opencv math operations
    libatlas-base-dev gfortran \
    libmp3lame-dev libtheora-dev \ # ?
    libvorbis-dev libxvidcore-dev libx264-dev \
    libopencore-amrnb-dev libopencore-amrwb-dev \
    libavresample-dev \
    x264 v4l-utils \
    # others
    libtbb2 libtbb-dev \
    # cleanup
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove

# Install python packages
RUN pip install --no-cache-dir \
    # OpenCV dependency
    numpy \
    # other usefull stuff
    ipython \
    # cleanup
    && find /usr/local \
       \( -type d -a -name test -o -name tests \) \
       -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
       -exec rm -rf '{}' + \
    && cd / \
    && rm -rf /usr/src/python ~/.cache

# Install OpenCV
COPY download_build_install_opencv.sh download_build_install_opencv.sh
RUN ./download_build_install_opencv.sh
