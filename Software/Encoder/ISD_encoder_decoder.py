"""

	Image Steganography Encoder using the LSB algorithm. Code taken from https://github.com/djrobin17/image-stego-tool
    Slight modifications have been made for the purpose of this project. 
    This version of the encoder converts the images to black and white but this can be changed by changing the value of n.
    
"""

#import libraries
import sys
import numpy as np
from PIL import Image
np.set_printoptions(threshold=sys.maxsize)

#encoding function
password = ""
def Encode(src, message, dest):

    img = Image.open(src, 'r')
    grey = img.convert("L")
    width, height = grey.size
    array = np.array(list(grey.getdata()))
    
    n = 1
    # if img.mode == 'RGB':
    #     n = 3
    # elif img.mode == 'RGBA':
    #     n = 4

    total_pixels = array.size//n

    b_message = ''.join([format(ord(i), "08b") for i in message])
    req_pixels = len(b_message)

    if req_pixels > (total_pixels):
        print("ERROR: Need larger file size")

    else:
        index=0
        for p in range(total_pixels):
            if index < req_pixels:
                array[p] = int(bin(array[p])[2:9] + b_message[index], 2)
                index += 1

        with open('stego.hex','w') as myfile:
            np.savetxt(myfile,array,fmt='%X')
        print('Array exported to files')

        array=array.reshape(height, width)
        enc_img = Image.fromarray(array.astype('uint8'), grey.mode)
        enc_img.save(dest)
        print("Image Encoded Successfully")

#main function
def Stego():
    print("--Welcome to $t3g0--")

    print("Enter Source Image Path")
    src = input()
    print("Enter Message to Hide")
    message = input()
    print("Enter Destination Image Path")
    dest = input()
    print("Encoding...")
    Encode(src, message, dest)

Stego()
