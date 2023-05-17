#imports
import sys
from subprocess import call
import time
from LSB_decoder import LSB_decoder

def main():
    start, end = 0, 0
    pyTiming = []
    cTiming = []
    f = open("Timing.txt", 'a')
    sys.stdout = f

    print("Python Timing")
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

    print("\n\nC Timing")    
    print("-----------------------------------------------")
    for i in range(10):
        call([".\LSB_decoder"], stdout=f, shell=True)

    f.close()

        

if __name__ == "__main__":
    main()