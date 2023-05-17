# imports - reading in hex file
from intelhex import IntelHex
import time
import binascii
 

# takes in list of bytes and converts to string of characters
def binary_to_string(bits):
    return ''.join([chr(int(i, 2)) for i in bits])

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
    f = open("stego_16_32.hex", "r")

    # loop through each line of hex file
    for line in f:
        # convert hex value into binary
        b = bin(int(line, 16)).zfill(8)

        # retrieve and save LSBs
        LSB = str((b[len(b) - 1]))
        lsbs_combined = lsbs_combined + LSB
        #print(lsbs_combined)

        count += 1

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

    # output message
    #print(out+"\n")

    # save output to txt
    #with open('PY_message.txt', 'w') as f:
    #    f.write(out)
        # print("Saved to PY_message.txt \n")

    # end performance timing
    end = time.perf_counter()

    # print timing
    # print(f"Decoded the message and saved to text file in {end - start:0.4f} seconds\n")
    print(f"{end - start}")

def main():
    LSB_decoder()

if __name__ == "__main__":
    main()