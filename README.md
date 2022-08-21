# project-raspi-firealarm

---

In this project, a __Raspberry Pi based IoT device__ is developed to __detect unattended cooktops with fire in a kitchen__. A PiCamera is used to continuously capture images in a kitchen, and the images are piped to TensorFlow Lite for human and fire detection. In the case unattended cooktops with fire are detected, an alarm is raised and messaged remotely to a cloud infrastructure.

The key work packages included in this project are:

1. Kitchen image capturing and pre-processing (for training ANN in the next step)
1. ANN training
1. Real-time image processing for unattended cooktops with fire detection
1. Remote alarm

Notice that due to the computational power limitation, the ANN training will be carried out on a separate server.  Regardless, the program for building and training the ANN model is still included in the project folder.

__Python 3.9__ is used to develop the majority part of this project. __TensorFlow__ and __TensorFlow Lite__ are the main machine learning engine used for image processing and ANN training.

Git is used to manage and oversee the project development. A development log is given in the later part of this document.

---

## Preparation

Configurations such as enabling the PiCamera needs to be setup on the target Raspberry Pi IoT device, and necessary software and associated packages need to be installed. Details are given below.

> Note: use `sudo apt update` and `sudo apt upgrade` to upgrade the OS and installed software before carrying out the preparation work.

### Enable PiCamera

1. Attach a Pi camera to the device.
1. Use `sudo raspi-config` to open the Raspberry Pi configuration tool.
1. Navigate to `Interfacing Options`, from where enable PiCamera.
1. Reboot the device.

> Note: consider testing the Pi camera using the `test_camera.py` program. Notice that python should be already installed in the Raspberry Pi OS by default.

### Install TensorFlow Lite and its dependencies

Depending on the complexity of the infrastructure, the TensorFlow Lite packages and dependencies can differ. For example, it is often a good practice to run TensorFlow Lite in a specific virtual environment or a container, which may complicate the packages installation procedure. In this project, virtual environment is not used, as the IoT device is dedicated for the project and there shouldn't be an migration problem in the future.

* Developer dependencies

The following table gives a list of dependencies that may or may not be helpful with running some of the codes in this project. Installation of these dependencies is optional. Notice that these dependencies are not specifically python packages, thus should be installed using `apt` tool, but not `pip` package installer for python.

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
| libx264-dev | advanced encoding library for creating H.264 (MPEG-4 AVC) video strams |
| qtbase5-dev | Qt5 base development files |
| libatlas-base-dev | automatically tuned linear algebra software |

> Use `apt-cache search <library-name>` to search for the brief introduction to a dependency, and `apt-cache policy <library-name>` to check the latest version and the installed version of a dependency, if the dependency exists in the repository. Use `apt install <library-name>` to install a dependency.

* OpenCV for python

__OpenCV (Open Source Computer Vision Library)__ is an open-source library that includes many computer vision algorithms. Install OpenCV for python using `pip install opencv-python`.

* TensorFlow

Use `pip install tensorflow` to install TensorFlow.

* TensorFlow Lite runtime

Use `pip install https://github.com/google-coral/pycoral/releases/download/v2.0.0/tflite_runtime-2.5.0.post1-cp39-cp39-linux_armv7l.whl` to install TensorFlow Lite runtime. Notice that it is recommended to double check the python version using `python --version` and download the associated TensorFlow Lite runtime from the given GitHub repository.

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

Open the python terminal using `python`, and test TensorFlow Lite runtime installation using
```python
from tflite_runtime.interpreter import Interpreter
```
If there is no error messages, the installation is successful.

* Others

Other python packages such as `argparse`, `protobuf` are also recommended for installation, as they will simplify the python code programming in later stages. Use `pip install` to install these packages similarly.

### Test TensorFlow Lite using a pre-trained demo model

Trained models for demonstration purpose can be found online [here](https://www.tensorflow.org/lite/examples "TensorFlow Lite Examples"). These demonstration examples are great for one to get familiar of using TensorFlow Lite on an IoT device. In this project, object detection demo is used for quick setup of the IoT device.


---

## Work Package 1: Kitchen image capturing and pre-processing

---

## Development Logs

20220821 - Get starter model with metadata from [TensorFlow](https://www.tensorflow.org/lite/examples/object_detection/overview "TensorFlow > Learn > For Mobile & Edge > Examples"), and store the tflite model in `model/sample-model/`  subdirectory.


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
