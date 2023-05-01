"""
	Image Steganography Encoder using the LSB algorithm. Code taken from https://github.com/djrobin17/image-stego-tool
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
