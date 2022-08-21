# -*- coding: utf-8 -*-
"""
sunlu - sunlu.electric@gmail.com
"""

import cv2 # require package opencv-python
import time
from datetime import datetime

IMAGE_RESOLUTION = (640, 480)
SAVE_PATH = '../data/camera_raw/'
IMAGE_INTERVAL = 5
IMAGE_NUM = 60

def collect_image(save_path: str, image_interval: int, image_num: int):
    cap = cv2.VideoCapture(0)
    time.sleep(5)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, IMAGE_RESOLUTION[0])
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, IMAGE_RESOLUTION[1])
    for i in range(image_num):
        ret, frame = cap.read()
        image_name = save_path + datetime.now().strftime('%Y-%m-%d-%H-%M-%S') + '.jpg'
        cv2.imwrite(image_name, frame)
        time.sleep(image_interval)
        if cv2.waitkey(1) & 0xFF == ord('q'):
            break
if __name__ == '__main__':
    collect_image(SAVE_PATH, IMAGE_INTERVAL, IMAGE_NUM)
