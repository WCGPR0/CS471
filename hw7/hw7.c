#include <stdio.h>

int loop() {
  int x[512];  
  int i=0;   
  while (i++ <512) {
    x[i] = 0;
  }
} 

int main () {
  printf("\nCalling loop  -->>\n");
  loop();
}

