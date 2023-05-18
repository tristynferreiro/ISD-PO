"""
	
    This program is a Golden Measure for the Image Steganography Detector (ISD). 
    The program processes every pixel in the image before converting the retrived LSBs to characters. The message is then 
    split using the delimeter in the retrived message.

"""
# imports
from intelhex import IntelHex
import time

# takes in list of bytes and converts to string of characters
def binary_to_string(bits):
    return ''.join([chr(int(i, 2)) for i in bits])

# LSB Decoder
def LSB_decoder_full_image_check():
    # variables
    lsbs_combined = ''
    out = ''

    # start performance timing
    start = time.perf_counter()

    # open file with hex values
    f = open("stego_2500.hex", "r")

    # loop through each line of hex file
    for line in f:
        # convert hex value into binary
        b = bin(int(line, 16)).zfill(8)

        # retrieve current lsb
        current_lsb = str(b[len(b) - 1])

        # combine all lsbs into single string
        lsbs_combined = lsbs_combined + current_lsb

    # break up lsbs into array of bytes
    bytes = [lsbs_combined[i:i+8] for i in range(0, len(lsbs_combined), 8)]

    # convert bytes into characters
    out = binary_to_string(bytes)

    # split actual output from rest of lsbs 
    out = out.split("$")[0]

    # end performance timing
    end = time.perf_counter()

    # output message
    print(out+"\n")

    # save output to txt
    with open('PY_message.txt', 'w') as f:
        f.write(out)
        # print("Saved to PY_message.txt \n")

    # print timing
    # print(f"Decoded the message and saved to text file in {end - start:0.4f} seconds\n")
    print(f"{end - start}")

def main():
    LSB_decoder_full_image_check()

if __name__ == "__main__":
    main()