# imports - reading in hex file
from intelhex import IntelHex

# takes in list of bytes and converts to string of characters
def binary_to_string(bits):
    return ''.join([chr(int(i, 2)) for i in bits])

def main():
    # variables
    lsbs_combined = ''
    out = ''

    # open file with hex values
    f = open("stego-1.hex", "r")

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

    # output message
    print(out)

if __name__ == "__main__":
    main()