"""
	Image to hex and coe file converter
"""
#import libraries
import sys
import numpy as np
from PIL import Image
np.set_printoptions(threshold=sys.maxsize)

#encoding function
password = ""
def convert(src, dest):

    img = Image.open(src, 'r')

    array = np.array(list(img.getdata()))
   
    with open(dest,'w') as myfile:
        for i in array:
            np.savetxt(myfile,i,fmt='%X')

    dest_coe_name = dest.split(".")
    dest_coe = dest_coe_name[0] + "." + dest_coe_name[1] + ".coe"
    print(dest_coe)
    counter = 0
    with open(dest_coe,'w') as myfile:
        myfile.write("memory_initialization_radix = 16;")
        myfile.write("\nmemory_initialization_vector=")
        for i in array:
            for j in i:
                myfile.write("%X"%j)
                if(counter<len(array)-1):
                    myfile.write(",")
            counter = counter + 1
        myfile.write(";")
    
            
    print("Image Converted Successfully")

#main function
def conversion():
    print("--Welcome to Hex Converter-")
    
    print("Enter Source Image Path")
    src = input()
    
    print("Enter Destination Image Path")
    dest = input()

    print("Converting...")
    convert(src, dest)

conversion()
