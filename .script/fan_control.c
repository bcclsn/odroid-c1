/*
 ============================================================================
 Name        : fan_control.c
 Author      : bcclsn
 Version     : 1.2
 Copyright   : null
 Description : controlla l'accensione e lo spegnimento di una ventola tramite
               transistor e pin gpio
 ============================================================================
 */
#include <wiringPi.h>

#define FTEMP     "/sys/class/thermal/thermal_zone0/temp"
#define LOGPATH   "/tmp/fan_control.log"
#define THRESHOLD 60000                                               // first two MSD (degree)
#define FORCED_ON 12                                                  // 12 cycle
#define GPIO_PIN  1

int os_read_d(char  *fname) {                                         // thanks to vbextreme
  FILE *fp = fopen(fname, "r");

  if (fp == NULL) {
    return -1;
  }

  char inp[64];
  inp[0] = 0;
  fgets(inp, 64, fp);
  fclose(fp);

  return strtoul(inp, NULL, 10);
}

void fan_log(int status) {
  FILE *log = fopen(LOGPATH, "w");

  if (status == -1)
    fprintf(log, "UND \n");
  else if (status == 0)
    fprintf(log, "the fan is OFF \n");
  else if (status == 1)
    fprintf(log, "the fan is ON \n");

  fclose(log);
}

void main(void) {
  int temperature;
  int counter = 0;
  int status = -1;

  wiringPiSetup();
  pinMode(GPIO_PIN, OUTPUT);

  while(1) {
    temperature = os_read_d(FTEMP);

    if (temperature >= THRESHOLD) {
       digitalWrite(GPIO_PIN, HIGH);                                  // start the fan
       counter = 0;                                                   // reset the counter
       status  = 1;
    } else {                                                          // else if temperature is under the threshold
       counter++;                                                     // start the counter
       if (counter > FORCED_ON) {                                     // after 12 cycle under the threshold (cycle * delay = one minute)
          digitalWrite(GPIO_PIN, LOW);                                // stop the fan
          status = 0;
       }
    }
  //printf("temperature: %d    status: %d\n", temperature, status);   // print on stdout for debug
    fan_log(status);
    delay(5000);
  }
}
