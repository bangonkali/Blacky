void setup() {
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {
}

void serialEvent1(){
  while (Serial1.available() ) {
    Serial.write(Serial1.read());
  }
}

void serialEvent(){
  while (Serial.available() ) {
    Serial1.write(Serial.read());
  }
}
