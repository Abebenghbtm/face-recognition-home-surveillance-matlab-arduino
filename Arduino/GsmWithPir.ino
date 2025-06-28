#include <SoftwareSerial.h>
#include <Servo.h>
 Servo myservo;   
int pos = 0;
SoftwareSerial mySerial(9,10);
#define pir 2
char mag; 
int SERIAL_VAL;
int buzzer=7;
void setup() {
mySerial.begin(9600);
Serial.begin(9600);
pinMode(2, INPUT);
  pinMode(3, INPUT);
   myservo.attach(3);
 delay(100);
pinMode(pir,INPUT);
pinMode(buzzer, OUTPUT);
}
void loop() {
int pirState=digitalRead(pir);
if(Serial.available()>0){
   SERIAL_VAL=Serial.read();
 if(SERIAL_VAL==1)
 {
  Servo_motor();
// if (pirState==1 ){
ReceiveMessage();
digitalWrite(buzzer, LOW);
 }
 //else if(pirState==0 ){
 if(SERIAL_VAL==2)
 {
   SendMessage();
 }


if(mySerial.available()>0){
  Serial.write(mySerial.read());
 }
}
}
void SendMessage()
{
 mySerial.println("intruder detected");
 //digitalWrite(buzzer, HIGH); 

  delay(1000);
}
void ReceiveMessage()
{
   mySerial.println("intruder not detected");
  delay(1000);
}
void Servo_motor()
{
     for (pos = 0; pos <= 180; pos += 1) {  
     
    myservo.write(pos);               
    delay(15);                       
  }
  for (pos = 180; pos >= 0; pos -= 1) {  
    myservo.write(pos);               
    delay(15);                       
  }
}


