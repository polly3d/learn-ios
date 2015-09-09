//
//  main.c
//  Hello world
//
//  Created by wang on 15/9/1.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#include <stdio.h>

void singTheSong(int numberOfBottles)
{
    if(numberOfBottles == 0)
    {
        printf("There are simply no more bottles of beer on the wall .\n");
    }
    else
    {
        printf("%d bottles of beer on the wall. %d bottles of beer. \n",numberOfBottles,numberOfBottles);
        int oneFew = numberOfBottles - 1;
        printf("Take on down,pass it aount,%d bottles of beer on the wall .\n",oneFew);
        singTheSong(oneFew);
        printf("Put a bottle in the recycling, %d empty bottles in teh bin. \n",numberOfBottles);
    }
}

int main(int argc, const char * argv[])
{
    singTheSong(99);
    return 0;
}
