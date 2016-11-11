/*
  LiquidCrystal Library - Serial Input

  Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
  library works with all LCD displays that are compatible with the
  Hitachi HD44780 driver. There are many of them out there, and you
  can usually tell them by the 16-pin interface.

  This sketch displays text sent over the serial port
  (e.g. from the Serial Monitor) on an attached LCD.

  The circuit:
   LCD RS pin to digital pin 12
   LCD Enable pin to digital pin 11
   LCD D4 pin to digital pin 5
   LCD D5 pin to digital pin 4
   LCD D6 pin to digital pin 3
   LCD D7 pin to digital pin 2
   LCD R/W pin to ground
   10K resistor:
   ends to +5V and ground
   wiper to LCD VO pin (pin 3)

  Library originally added 18 Apr 2008
  by David A. Mellis
  library modified 5 Jul 2009
  by Limor Fried (http://www.ladyada.net)
  example added 9 Jul 2009
  by Tom Igoe
  modified 22 Nov 2010
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/LiquidCrystalSerial
*/

// include the library code:
#include <LiquidCrystal.h>
#include <avr/interrupt.h>
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(48, 46, 44, 42, 40, 38, 36, 34, 32, 30, 28);
int __counter = 0;


//arduino runs the setup function first, then the loop function below
void setup() {
  pinMode(24, OUTPUT); //K
  pinMode(26, OUTPUT); //A
  pinMode(54, OUTPUT); //VSS
  pinMode(52, OUTPUT); //VDD
  pinMode(50, OUTPUT); //Contrasty pin

  // digitalWrite(50, LOW);
  digitalWrite(24, LOW); //Backlight
  digitalWrite(26, HIGH); //Backlight
  digitalWrite(54, LOW); //GND
  digitalWrite(52, HIGH); //VDD
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // initialize the serial communications:
  Serial.begin(9600);
  // Timer0 is used for millis() - we'll just interrupt
  // in the middle and call the compA
  OCR0A = 0x01;
  TIMSK0 |= _BV(OCIE0A);

  Serial.setTimeout(1);
}

SIGNAL(TIMER0_COMPA_vect) 
{
   __counter++;
   if (__counter > 14){
      digitalWrite(50,HIGH);
      __counter = 0;
   }
   else if (__counter > 3){
      digitalWrite(50, LOW);
   }
}

int min_ = -1;
int sec_ = -1;

//Must have input be of form t\d\d\d\d
void setTimer(String input) {

  //Invalid input
  if(input[0] != 't') {
    Serial.print("Invalid input\n");
    return;
  }

  //Else define min and sec
  min_ = input.substring(1,3).toInt();
  sec_ = input.substring(3,5).toInt();
}

//Assume 1 second has passed
void increaseTime() {
  if (sec_ == -1 || min_ == -1) return;
  sec_++;
  if (sec_ > 59) {
    sec_ = 0;
    min_++;
  }
  if (min_ > 59) {
    min_ = 0;
  }
}

int timeElapsed = -1;

//Here is where your code goes. Arduino runs this function in an infinite loop after running the setup function
void loop() {

  if (timeElapsed == -1) { timeElapsed = millis(); }

  String input_ = Serial.readString();// read a string sent from the computer
  Serial.print(input_);//prints hello world to the serial monitor

  //Stop if needed, otherwise do waht was requested.
  if (input_ == "Stop timer") {
    Serial.print("Stopped");
    min_  = sec_ = -1;
  }
  else if (input_ != "") {
    setTimer(input_);
  }  
  
  //return cursor to starting position
  lcd.home();

  //clear the lcd screen
  lcd.clear();
  
  //displays a String on the lcd screen. You can also print a String object
  lcd.print("Blobby is god!");
  
  //sets the x,y position of the cursor. In this case we move the cursor to the second line.
  lcd.setCursor(1, 1);
  lcd.print("Time: ");

  if (min_ != -1 && sec_ != -1) {
    lcd.print(min_);
    lcd.print(":");
    if (sec_ < 10) { lcd.print("0"); }
    lcd.print(sec_);
  }

  //Increase the time
  increaseTime();

  //sleep for .5 seconds
  int tmp = (500-(millis() - timeElapsed));
  delay(tmp>=0?tmp:0);

  //Blink if needed
  if (!(min_ != -1 && sec_ != -1)) { lcd.print("1200"); }
  tmp = (1000-(millis() - timeElapsed));

  //sleep for .5
  delay(tmp>=0?tmp:0);
  timeElapsed = millis();

}


