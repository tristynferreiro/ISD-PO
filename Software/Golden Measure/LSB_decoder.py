from intelhex import IntelHex
# pip install intelhex
def main():
    print("Hello World!")
    f = open("stego.hex", "r")
    for line in f:
        print(line)

if __name__ == "__main__":
    main()