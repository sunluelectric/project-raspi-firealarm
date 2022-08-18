# project-raspi-firealarm

---

In this project, a __Raspberry Pi based IoT device__ is developed to __detect unattended cooktops with fire in a kitchen__. A PiCamera is used to continuously capture images in a kitchen, and the images are piped to TensorFlow Lite for human and fire detection. In the case unattended cooktops with fire are detected, an alarm is raised and messaged remotely to a cloud infrastructure.

The key work packages included in this project are:

1. Kitchen image capturing and pre-processing (for training ANN in the next step)
1. ANN training
1. Real-time image processing for unattended cooktops with fire detection
1. Remote alarm

Notice that due to the computational power limitation, the ANN training will carried out on a separate server. The program for building the ANN model and carrying out the training is still included in the project folder.

__Python 3.10__ is used to develop the majority part of this project. __TensorFlow__ and __TensorFlow Lite__ are the main machine learning engine used for image processing and ANN training.

Git is used to manage and oversee the project development. A development log is given in the later part of this document.

---

## Work Package 1: Kitchen image capturing and pre-processing

---

## Development Logs

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


