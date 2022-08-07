# runs through a video frames via cython
import numpy as np
import cv2
import time

cpdef int function(int number):

    cdef bint video_true = True
    
    cap = cv2.VideoCapture('out_icloudphotos1.mkv')

    cdef int y = 1
    cdef int i

    cdef int increment = 0
    cdef int increment_times = 0
    cdef int fno = 1
    cdef double dt = 0.0
    cdef double t0 = 0.0    
    cdef int cnt = cap.get(cv2.CAP_PROP_FRAME_COUNT)
    print(cnt)
    while(1):
        # Capture frame-by-frame
        ret, frame = cap.read()

        if ret == False:
            break
        # Our operations on the frame come here
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        if fno % 100 == 0:
            dt = time.time() - t0
            print(frame.shape, fno, 100 / dt)
            t0 = time.time()
        fno += 1

    cap.release()
    return 0
