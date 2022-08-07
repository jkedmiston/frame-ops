import time
from queue import Queue
from threading import Thread
import sys
import cv2
from filevideostream import FileVideoStream

# https://pyimagesearch.com/2015/12/21/increasing-webcam-fps-with-python-and-opencv/
path = 'out_icloudphotos1.mkv'


def operation(frame):
    time.sleep(0.2)
    return frame


obj = FileVideoStream(path=path, transform=operation)
fvs = obj.start()
time.sleep(1)
t0 = time.time()
ct = 0
while fvs.more():
    print(ct)
    ct += 1
    frame = fvs.read()

    # do something expensive
    time.sleep(0.2)

    dt = time.time() - t0
    fps = 1./dt
    print(frame.shape, fps)
    t0 = time.time()
fvs.stop()

t1 = time.time()
print(t1-t0)
