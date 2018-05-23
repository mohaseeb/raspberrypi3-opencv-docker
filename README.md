## About
The Git repo of an [OpenCV](https://opencv.org/) [Docker image](https://hub.docker.com/r/mohaseeb/raspberrypi3-python-opencv/)
, for Raspberry Pi 3 with Raspbian OS (Debian). The modules from OpenCV 
contrib are included as well.  It is based on [the resin.io python image](https://hub.docker.com/r/resin/raspberrypi3-python/).

## Usage
See [the image Docker Hub page](https://hub.docker.com/r/mohaseeb/raspberrypi3-python-opencv/)
 for information on how to use the image.

## Build
If you prefer to build the image yourself (takes around 2 hours), you can do it as follows:
* Clone this repository into a Raspberry Pi 3 running Raspbian OS.
```commandline
git clone git@github.com:mohaseeb/raspberrypi3-opencv-docker.git
cd raspberrypi3-opencv-docker/opencv-<version>
```
* Build the image by running:
```commandline
docker build -t my_pi_opencv_img .
```
* And run it
```commandline
docker run -it --rm \
       --name my_opencv_app_run \
       my_pi_opencv_img \
       python -c "import cv2; print(cv2.__version__)"
```

## Credits
Some of the steps in [this blog post](https://www.pyimagesearch.com/2016/04/18/install-guide-raspberry-pi-3-raspbian-jessie-opencv-3/)
is what I used to understand how to build and install OpenCV in Raspberry Pi.
