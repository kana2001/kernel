extern "C" void main(){

    const char *str = "Hello! Welcome to Aditya's basic operating system :)";
    char *vidptr = (char *)0xb8000;
    unsigned int i = 0;
    unsigned int j = 0;

    while (str[j] != '\0')
    {
        vidptr[i] = str[j];    //store first char
        vidptr[i + 1] = 0x15; //set colours
        ++j;
        i = i + 2;
    }

    return;
}