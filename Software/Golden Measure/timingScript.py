"""
	
    Timing script for Golden Measure testing. This script runs each of the 3 versions of Golden Measure 10 times and saves the timing values to a text file. 
    All timing is completed within the indiviidual programs to ensure that overhead does not skew the results.

"""

#imports
import sys
from subprocess import call
from LSB_decoder import LSB_decoder
from LSB_decoder_full_image_check import LSB_decoder_full_image_check

def main():
    # open file to save timing data
    f = open("Timing_stego_2500.txt", 'a')

    # set system output to the timing file - all printed values will be written to the file
    sys.stdout = f

    print("Python Timing (with breaking)")
    print("-----------------------------------------------")
    # run python program that processes until delimeter 10 times (with timing)
    for i in range(10):
        LSB_decoder()

    print("Python Timing (without breaking)")
    print("-----------------------------------------------")
    # run python program that processes all bits 10 times (with timing)
    for i in range(10):
        LSB_decoder_full_image_check()

    print("\n\nC Timing")    
    print("-----------------------------------------------")
    # run c program 10 times (with timing)
    for i in range(10):
        call([".\LSB_decoder"], stdout=f, shell=True)

    # close timing file
    f.close()

        
if __name__ == "__main__":
    main()