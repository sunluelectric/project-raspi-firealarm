# project-raspi-firealarm

---

In this project, a __Raspberry Pi based IoT device__ is developed to __detect unattended gas cooktops with fire in a kitchen__. The IoT device uses PiCamera to continuously capture images in a kitchen, and the images are piped to TensorFlow Lite for object detection for human and fire. In the case unattended fire is detected, an alarm is raised and messaged to the user through a cloud infrastructure.

The key work packages included in this project are:

1. Kitchen images capturing and processing
1. Images labeling
1. ANN training
1. Human and fire detection on IoT device
1. Alarms messaging

Notice that the images labeling and the ANN training will be carried out on separate servers. Regardless, the details of these work packages, including the software used for images labeling and the program for building and training the ANN model are introduced in this project folder.

__Python 3.9__ is used to develop the majority part of this project. __TensorFlow__ and __TensorFlow Lite__ are the main machine learning engines used for ANN training and real-time object detection.

Git is used to manage and oversee the project development. Development and testing logs are given in the later part of this document.

---

## Preparation

Configurations such as enabling the PiCamera needs to be setup on the target Raspberry Pi IoT device, and necessary software and associated packages need to be installed. Details are given below.

> Note: use `sudo apt update` and `sudo apt upgrade` to upgrade the OS and installed software before carrying out the remaining procudures.

### Enabling PiCamera

1. Attach a Pi camera to the device.
1. Use `sudo raspi-config` to open the Raspberry Pi configuration tool.
1. Navigate to `Interfacing Options` and enable PiCamera.
1. Reboot the device.

> Note: consider testing the Pi camera using the `test_camera.py` program. Notice that python should be already installed in the Raspberry Pi OS by default.

### Installing TensorFlow Lite and its dependencies

Depending on the system infrastructure, the required TensorFlow Lite packages and dependencies differ largely. For example, it is often a good practice to run TensorFlow Lite in a virtual environment or a container. This provides an isolated and safe runtime environment for the program, but at the same time add complexity to the packages and dependencies installation and system setup.

In this project, virtual environment is not used, as the IoT device is dedicated for the project. Neither should there be a migration problem in the future.

* Dependencies for Raspberry Pi OS

The following table gives a list of dependencies for the Raspberry Pi OS that may be helpful with running some of the codes in this project.

| Dependency | Explanation |
| ---------- | ----------- |
| libjpeg-dev | development files for the JPEG library [dummy package] |
| libtiff5-dev | Tag Image File Format (TIFF) library, development files |
| libjasper-dev | development files for the JasPer JPEG-2000 library |
| libpng12-dev | development files for the PNG library |
| libavcodec-dev | development files for FFmpeg library with de/encoders for audio/video codecs |
| libavformat-dev | development files for FFmpeg library with (de)muxers for multimedia containers |
| libswscale-dev | development files for FFmpeg library for image scaling and various conversions |
| libv41-dev | a collection of libraries which adds a thin abstraction layer on top of video4linux2 devices |
| libxvidcore-dev | development files for the open source MPEG-4 video codec |
| libx264-dev | advanced encoding library for creating H.264 (MPEG-4 AVC) video streams |
| qtbase5-dev | Qt5 base development files |
| libatlas-base-dev | automatically tuned linear algebra software |

> Use `apt-cache search <library-name>` to search for a brief introduction to a dependency, and `apt-cache policy <library-name>` to check the latest version and the installed version of a dependency, if the dependency exists in the repository. Use `sudo apt install <library-name>` to install a dependency.

* Python packages

__OpenCV (Open Source Computer Vision Library)__ is an open-source library that includes many computer vision algorithms. Install OpenCV for python using `pip install opencv-python`.

__TensorFlow__ and __TensorFlow Lite__ are the main machine learning engines used in this project. Notice that in the IoT device, installation of TensorFlow is optional, as it is used for only ANN training, which is carried out on a separate server. However, installation of TensorFlow Lite runtime is compulsory.  

Use `pip install tensorflow` to install TensorFlow.

Use `pip install https://github.com/google-coral/pycoral/releases/download/v2.0.0/tflite_runtime-2.5.0.post1-cp39-cp39-linux_armv7l.whl` to install TensorFlow Lite runtime, if python 3.9 is used. Notice that it is recommended to double check the python version using `python --version` before this installation, and download the associated TensorFlow Lite runtime from the GitHub repository.

Use `pip install tflite-support` to install tflite-support, which is a cross-platform library that helps to deploy TensorFlow Lite models onto mobile devices.

> An [alternative way](https://pimylifeup.com/raspberry-pi-tensorflow-lite/ "Installing TensorFlow Lite on the Raspberry Pi") of installing TensorFlow Lite runtime is given as follows.
> 1. Add the repository using
```bash
echo "deb [signed-by=/usr/share/keyrings/coral-edgetpu-archive-keyring.gpg] https://packages.cloud.google.com/apt coral-edgetpu-stable main" | sudo tee /etc/apt/sources.list.d/coral-edgetpu.list
```
> 2. Add its GPG key into the keychains directory using
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/coral-edgetpu-archive-keyring.gpg >/dev/null
```
> 3. Update the repository and install TensorFlow Lite runtime using
```bash
sudo apt update
sudo apt install python3-tflite-runtime
```

To verify the installation of TensorFlow Lite, run `python` with the following command
```python
from tflite_runtime.interpreter import Interpreter
```
If there is no error messages, the installation is successful.

Other python packages such as `argparse`, `protobuf` are also recommended for installation, as they will simplify the python code programming in later stages. Use `pip install <package-name>` to install these packages.

## Getting familiar with TensorFlow Lite using demonstration examples

Demonstration examples can be found from [TensorFlow](https://www.tensorflow.org/lite/examples "TensorFlow Lite Examples"). These examples are great for one to get familiar of using TensorFlow Lite on IoT devices.

In this project, object detection demonstration example is used which helps with the setup of the IoT device, and this sample example is included in `sample-example/`.

---

## Work Package 1: Kitchen images capturing and processing

The purpose of this work package is mainly to automatically collect massive images from a kitchen and carry out necessary image processing. These pictures are later transferred to a separate server for image labeling.

There are multiple ways to program a piece of python code to collect massive JPG files taken from the Raspberry Pi Camera. To name a few, it is possible to use `PiCamera` package as used in the `test_camera.py` program, or use `VideoCapture` tool provided by `opencv-python`. Both of the above approaches should satisfy the purpose. Notice that `VideoCapture` approach is more general in the sense that it can be used not only on Raspberry Pi but also other devices as long as it has a camera. Therefore, `VideoCapture` approach is adopted for collecting images in this project.

---

## Work Package 2: Images labeling

Labeling of images are done not on the IoT device, but on the server with a specific tool.

---

## Work Package 3: ANN training

---

## Work Package 4: Human and fire detection on IoT device

---

## Work Package 5: Alarms messaging

---

## Development Logs

20220821 - Get starter model with metadata from [TensorFlow](https://www.tensorflow.org/lite/examples/object_detection/overview "TensorFlow > Learn > For Mobile & Edge > Examples"), and store the tflite model in `sample/` directory. Download sample programs from [TensorFlow GitHub](https://github.com/tensorflow/examples/tree/master/lite/examples/object_detection/raspberry_pi "tensorflow/examples/lite/examples/object_detection/raspberry_pi/") for testing and analysis purpose.


---

## Testing Logs

---

## References

* Books

  > Szeliski, R., 2010. Computer vision: algorithms and applications. Springer Science & Business Media.

  > Lakshmanan, V., Görner, M. and Gillard, R., 2021. Practical Machine Learning for Computer Vision. O'Reilly Media, Incorporated.

* Tutorials

  > freeCodeCamp.org, https://youtu.be/tPYj3fFJGjk

  > Python Engineer, https://youtu.be/c36lUUr864M

  > Edge Electronics, https://youtu.be/aimSGOAUI8Y

  > Nicholas Renotte, https://youtu.be/yqkISICHH-U
