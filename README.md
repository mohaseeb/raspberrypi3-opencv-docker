## About
The Git repo of an OpenCV (python interface) [Docker image](https://hub.docker.com/r/mohaseeb/raspberrypi3-python-opencv/)
, for Raspberry Pi 3 with Raspbian OS (Debian).

## Usage
See [the image Docker Hub page](https://hub.docker.com/r/mohaseeb/raspberrypi3-python-opencv/)
 for information on how to use the image.

## Build
If you prefer to build the image yourself (takes around 3 hours!), you can do it as follows:
* Clone this repository into a Raspberry Pi 3 running Raspbian OS.
```commandline
git clone git@github.com:mohaseeb/raspberrypi3-opencv-docker.git
cd raspberrypi3-opencv-docker
```
* (Optionally) change the OpenCV version to be installed in the image by editing [download_build_install_opencv.sh](download_build_install_opencv.sh) script.
* Build the image by running:
```commandline
docker build -t my_pi_opencv_img .
```

## Credits
Some of the steps in [this blog post](https://www.pyimagesearch.com/2016/04/18/install-guide-raspberry-pi-3-raspbian-jessie-opencv-3/)
is what I used to understand how to build and install OpenCV in Raspberry Pi.
