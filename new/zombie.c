#include <stdlib.h>
#include <stdio.h>

int main() {
        pid_t pid;
        int i; 
    
        for (i = 0; ; i++)  {  
                pid = fork();
    
                if (pid > 0) {
                        // parent process
                                                printf("Zombie #%d born:\n", i + 1);
                                                                        sleep(1);
                                                                                        } else {
                                                                                                                 // child process: drivel then exit
                                                                                                                                         printf("    *drool* Boooo! Arrgghh! *slobber*\n");
                                                                                                                                                                 exit(0);
                                                                                                                                                                                 }  
                                                                                                                                                                                         }  
                                                                                                                                                                                             
                                                                                                                                                                                                     return 0; 
                                                                                                                                                                                                     }


// steps to execute this test script
// cc ./zombie.c -o ./zombie
//./zombie
//
