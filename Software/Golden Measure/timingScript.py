#imports
import sys
from subprocess import call
import time
from LSB_decoder import LSB_decoder
from LSB_decoder_full_image_check import LSB_decoder_full_image_check

def main():
    start, end = 0, 0
    pyTiming = []
    cTiming = []
    f = open("Timing_stego_16_32.txt", 'a')
    sys.stdout = f

    print("Python Timing (with breaking)")
    print("-----------------------------------------------")
    for i in range(10):
        #call(["python LSB_decoder.py"], stdout=f, shell=True)
            #start = time.perf_counter()
            LSB_decoder()
            #end = time.perf_counter()

            #temp = float(end - start)
            #pyTiming.append(temp)
            #print(temp)
    
    #pyAve = sum(pyTiming)/len(pyTiming)
    #print("Average Time: ", pyAve)

    print("Python Timing (without breaking)")
    print("-----------------------------------------------")
    for i in range(10):
        #call(["python LSB_decoder.py"], stdout=f, shell=True)
            #start = time.perf_counter()
            LSB_decoder_full_image_check()
            #end = time.perf_counter()

            #temp = float(end - start)
            #pyTiming.append(temp)
            #print(temp)
    
    #pyAve = sum(pyTiming)/len(pyTiming)
    #print("Average Time: ", pyAve)

    print("\n\nC Timing")    
    print("-----------------------------------------------")
    for i in range(10):
        call([".\LSB_decoder"], stdout=f, shell=True)

    f.close()

        

if __name__ == "__main__":
    main()