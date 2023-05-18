#include <stdio.h>
#include <string.h>
 #include <time.h>

int numBytes = 150000;

int main(){
    /********* TIMING ************/
    clock_t start, end;
    double cpu_time_used;
    
    start = clock(); // START TIMING

    /*****************************/

    int numBits = 8*numBytes;
    /* READ IN THE CONTENTS OF THE .hex FILE*/
    FILE *hfile;

    // Open file in read mode
    hfile = fopen("stego_2500.hex", "r");

    // If the file does not exist, print error message and terminate program
    if(hfile == NULL) {
        printf("Not able to open the file.");
        return 1;
    }

    /* STORING FILE CONTENTS IN ARRAY */
    char myString[1000];
    char message[numBits];
    int lsb[8];
    int count = 0;

    // Read the contents of the file and retrieve LSBs
    while(fgets(myString, 1000, hfile)) {
        //printf("%s",myString);

        sscanf(myString,"%x",(lsb+count));
        *(lsb+count) = *(lsb+count)&1; //get LSB and store in the array

        //printf("%d\n",*(lsb+count));

        /* GROUP LSBS INTO BYTES TO DECODE MESSAGE */ 
        if(count==8){
            int decimal = 0;
            char character;

            // bit shift LSBs stored in array to store byte as binary integer
            decimal = lsb[0]<<7 | lsb[1]<<6 | lsb[2] <<5 | lsb[3] <<4 | lsb[4] <<3 | lsb[5] <<2 | lsb[6] <<1 | lsb[7] ;
            //printf("\nThe decimal value is: %d\n",decimal);

            // convert binary integer to character
            character = (char) decimal;
            //printf("The char is: %c\n",character);

            // if the delimeter is found, stop processing
            if(character=='$'){ 
                break;
            }

            // add characters to message array
            sprintf(message, "%s%c", message, character);  

            // reset count to 0
            count = 0;
        }

        // increment count for each LSB retrieved
        count=count+1;
    }

    // Close the file
    fclose(hfile);

    /* WRITE RECOVERED MESSAGE TO FILE*/

    FILE *hfile2;

    // Try to open file
    hfile2 = fopen("c_message.txt","w");

    // If the file cannot be opened, print error message and terminate program
    if(hfile2 == NULL) {
        printf("Not able to open the output file.");
        return 1;
    }

    // Write message to file
    fputs(message,hfile2);

    // Close file
    fclose(hfile2);

    /********* TIMING ************/
    end = clock(); // END TIMING

    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC; // Convert ticks to seconds
    //printf("Time %f seconds\n",cpu_time_used);

    printf("%f\n", cpu_time_used);
    /****************************/
    
}