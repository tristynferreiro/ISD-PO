"""
	image to hex and coe file converter
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
    width, height = img.size
    array = np.array(list(img.getdata()))

    if img.mode == 'RGB':
        n = 3
    elif img.mode == 'RGBA':
        n = 4

    total_pixels = array.size//n

   
    with open(dest,'w') as myfile:
        for i in array:
            np.savetxt(myfile,i,fmt='%X')

    dest_coe_name = dest.split(".")
    dest_coe = dest_coe_name[0] + ".coe"
    line_counter = 0
    with open(dest_coe,'w') as myfile:
        myfile.write("memory_initialization_radix = 16;")
        myfile.write("\nmemory_initialization_vector=")
        for i in array:
            myfile.write(hex(i))
            myfile.write(",")
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
