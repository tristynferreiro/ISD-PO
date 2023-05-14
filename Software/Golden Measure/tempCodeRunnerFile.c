
    hfile = fopen("message.txt","w");
    if(hfile == NULL) {
        printf("Not able to open the output file.");
        return 1;
    }
    fputs(message,hfile);
    fclose(hfile);