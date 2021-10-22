#include <LiquidCrystal.h>// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(2, 3, 4, 5, 6, 7);

#define ir A0

int relay = 13; // Out for light 

int flag=0;
int person = 1; 

void setup(){
Serial.begin(9600);// initialize serial communication at 9600 bits per second:
Serial.println(person);
delay(1000);
pinMode(relay, OUTPUT);

lcd.begin(16, 2);
//lcd.setCursor(0, 0);
//lcd.print("     Welcome    ");
//delay(1000); // Waiting for a while
//lcd.clear(); 
}

void loop(){ 
if(digitalRead(ir) == 0){
if(flag==0){ flag=1;
person = person+1;
if(person>6){person=1;}
//Serial.print(person);
delay(1000); 
}
}else{flag=0;
delay(1000);
Serial.println(person);
delay(1000);
}

lcd.setCursor(0, 0);

if(person>5){digitalWrite(relay,HIGH); lcd.print("   new crate    ");}
else{digitalWrite(relay,LOW);          lcd.print("   this crate    ");}

lcd.setCursor(6, 1); 
lcd.print(person);
}
