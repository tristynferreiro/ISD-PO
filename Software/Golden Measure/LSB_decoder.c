#include <stdio.h>
#include <string.h>
 #include <time.h>

int numBytes = 150000;

int main(){
    /*********Timing************/
    clock_t start, end;
    double cpu_time_used;
    /***************************/
    
    start = clock(); // START TIMING

    int numBits = 8*numBytes;
    /* READ IN THE CONTENTS OF THE .hex FILE*/
    FILE *hfile;
    // Open a file in read mode
    hfile = fopen("stego_16_32.hex", "r");
    // Print some text if the file does not exist
    if(hfile == NULL) {
        printf("Not able to open the file.");
        return 1;
    }
    // Store the content of the file
    char myString[1000];
    char message[numBits];
    int lsb[8];
    int count = 0;

    // Read the content and print it
    while(fgets(myString, 1000, hfile)) {
        //printf("%s",myString);
        sscanf(myString,"%x",(lsb+count));
        *(lsb+count) = *(lsb+count)&1; //get LSB and store that in the array
        //printf("%d\n",*(lsb+count));

        if(count==8){
            /* group into characters */ 
            int decimal = 0;
            //char character[8];
            char character;
            decimal = lsb[0]<<7 | lsb[1]<<6 | lsb[2] <<5 | lsb[3] <<4 | lsb[4] <<3 | lsb[5] <<2 | lsb[6] <<1 | lsb[7] ;
            //printf("\nThe decimal value is: %d\n",decimal);
            character = (char) decimal;
            //printf("The char is: %c\n",character);

            /******** (might need to remove this to be fair towards the FPGA) **********/
            if(character=='$'){ // search for delimiter and stop reading if found 
                break;
            }
            /*****************************************************************************/

            sprintf(message, "%s%c", message, character);  
            count = 0;
        }
        count=count+1;
    }

    // Close the file
    fclose(hfile);

    FILE *hfile2;
    hfile2 = fopen("c_message.txt","w");
    if(hfile2 == NULL) {
        printf("Not able to open the output file.");
        return 1;
    }

    fputs(message,hfile2);
    fclose(hfile2);
    /*********Timing************/
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("Time %f seconds\n",cpu_time_used);
    printf("%f\n", cpu_time_used);
    /***************************/
    
}