# ISD-PO
Steganography is not a modern technique however digital media forms have made it more widespread. Many types of steganography mediums and algorithms exist. This paper specifically focuses on image steganography decoding using a least significant bit algorithm. Previous studies have focused on the quality of the image after decoding whilst maximising storage capacity. This report will focus on the speedup experience when parallelising the decoding algorithm using an FPGA. The system is synthesised in Verilog on an Artix-7 before being implemented on the physical FPGA. The Verilog code is parallelised by generating a module on the FPGA for each byte of the secret message that will need to be processed. Both implementations are compared to a sequential implementation developed in both python and C to determine effectiveness. The BRAM was found to be a bottleneck on the FPGA implementation yet despite this speedups of 20 were seen when compared to the python measure. The FPGA had large speedup when compared to the C measure for small images however, once the images were large, the C program was more efficient.

![Image of C3P0](https://github.com/tristynferreiro/ISD-PO/blob/main/Docs/c3p0.png)
*Image of C-3P0 used to test code*

Add in the cute block diagram
### Hardware Specifications
This project is designed to work on the Nexys A7 100T. The module layout has been shown below.
