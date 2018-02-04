FROM resin/raspberrypi3-python:2.7

# Install dependencies needed for building and running OpenCV
RUN apt-get update && apt-get install -y --no-install-recommends \
    # to build and install
    unzip \
    build-essential cmake pkg-config \
    # to work with images
    libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev \
    # to work with videos
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    # needed by highgui tool
    libgtk2.0-dev \
    # for opencv math operations
    libatlas-base-dev gfortran \
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
