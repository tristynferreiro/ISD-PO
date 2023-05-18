"""
	
    This program is a Golden Measure for the Image Steganography Detector (ISD). 
    The program does not process every pixel but processes 8 LSBs at a time until the delimeter is found. It then returns the message and writes it to a text file.
    The remaining pixels are not processed.

"""

# imports - reading in hex file
from intelhex import IntelHex
import time

# LSB Decoder
def LSB_decoder():
    # variables
    lsbs_combined = ''
    character = ''
    out = ''
    count = 0

    # start performance timing
    start = time.perf_counter()

    # open file with hex values
    f = open("stego_2500.hex", "r")

    # loop through each line of hex file
    for line in f:
        # convert hex value into binary
        b = bin(int(line, 16)).zfill(8)

        # retrieve and save LSBs
        LSB = str((b[len(b) - 1]))
        lsbs_combined = lsbs_combined + LSB

        # counter tp keep track of number of bits collected
        count += 1

        # once a byte is collected, convert to char
        if (count == 8):
            # convert byte into character
            val = int(lsbs_combined, 2)
            character = chr(val)

            # if character is the delimeter break
            if (character == '$'):
                break
            
            # save character string
            out = out + str(character)

            # reset count and lsbs_combined
            count = 0
            lsbs_combined = ''

    # end performance timing
    end = time.perf_counter()
    
    # output message
    print(out+"\n")

    # save output to txt
    with open('PY_message.txt', 'w') as f:
        f.write(out)
        print("Saved to PY_message.txt \n")

    # print timing
    # print(f"Decoded the message and saved to text file in {end - start:0.4f} seconds\n")
    print(f"{end - start}")

def main():
    LSB_decoder()

if __name__ == "__main__":
    main()