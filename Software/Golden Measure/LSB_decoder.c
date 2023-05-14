#include <stdio.h>
#include <string.h>

int numBytes = 10;

int main(){
    int numBits = 8*numBytes;
    /* READ IN THE CONTENTS OF THE .hex FILE*/
    FILE *hfile;
    // Open a file in read mode
    hfile = fopen("stego.hex", "r");
    // Print some text if the file does not exist
    if(hfile == NULL) {
        printf("Not able to open the file.");
        return 1;
    }
    // Store the content of the file
    char myString[100];
    //int lsb[numBits];
    int lsb[8];
    int count = 0;

    char message [numBits];
    // Read the content and print it
    while(fgets(myString, 100, hfile)) {
        // printf("%s",myString);
        sscanf(myString,"%x",(lsb+count));
        *(lsb+count) = *(lsb+count)&1; //get LSB and store that in the array
        //printf("%d\n",*(lsb+count));

        if(count==7){
            /* group into characters */ 
            int decimal = 0;
            char character[8];
            decimal = lsb[0]<<7 | lsb[1]<<6 | lsb[2] <<5 | lsb[3] <<4 | lsb[4] <<3 | lsb[5] <<2 | lsb[6] <<1 | lsb[7] ;
            //printf("\nThe decimal value is: %d\n",decimal);
            sprintf(character, "%c", decimal);  
            printf("The char is: %s\n",character);
        
            strcat(message, character); 
        }
        count=count+1;
        
    }
    // Close the file
    fclose(hfile);

    // /* group into characters */ 
    // int decimal = 0;
    // char character[8];
    // char message [numBits];
    // for (int i =0; i<numBits; i+=8){
    //     // get decimal value from bits
    //     decimal = 0;
    //     decimal = lsb[i+0]<<7 | lsb[i+1]<<6 | lsb[i+2] <<5 | lsb[i+3] <<4 | lsb[i+4] <<3 | lsb[i+5] <<2 | lsb[i+6] <<1 | lsb[i+7] ;
    //     //printf("\nThe decimal value is: %d\n",decimal);
    //     sprintf(character, "%c", decimal);  
    //     //printf("The char is: %s\n",character);
    //     if(!strcmp(character,"$")){ // search for delimiter
    //          break;
    //     }
    //     strcat(message, character); 
    //     printf("The char is: %s\n",message);
    // }
    // printf("The message is: %s\n",message);
    
    hfile = fopen("message.txt","w");
    if(hfile == NULL) {
        printf("Not able to open the output file.");
        return 1;
    }
    fputs(message,hfile);
    fclose(hfile);
    
}