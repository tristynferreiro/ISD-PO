# ISD-PO
While steganography is not a modern technique, digital media forms have made it more widespread. Several mediums and algorithms of steganography exist. This paper considers image steganography decoding using a least significant bit algorithm. Many previous studies have focused on the quality of images after decoding whilst maximising storage capacity. This report however, places focus on speedup experienced when parallelising the decoding algorithm using an FPGA. The system is synthesised in Verilog on an Artix-7 before being implemented on the physical FPGA. The Verilog code is parallelised by generating a module on the FPGA for each byte of the secret message that will need to be processed. Both implementations are compared to sequential implementations developed in Python and C to determine effectiveness. The BRAM was found to be a bottleneck of the FPGA implementation. Despite this, speedups of 20 were achieved in comparison to the python measure. The FPGA had large speedup when compared to the C measure for small images however, once the images were large, the C program was more efficient.

![Image of C3P0](https://github.com/tristynferreiro/ISD-PO/blob/main/Docs/c3p0.png)

*Image of C-3P0 used to test code*

![System Block Diagram](https://github.com/tristynferreiro/ISD-PO/blob/main/Docs/BlockDiagram.jpg)

*Block Diagram of System*

### Hardware Specifications
This project is designed to work on the Nexys A7 100T. The module layout has been shown below.

![module blocks](https://github.com/tristynferreiro/ISD-PO/blob/main/Docs/HardwareVerilogBlockDiagram.png)
