void setup() {
  // initialize serial:
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {
  // print the string when a newline arrives:
  while (Serial1.available() ) {
    Serial.print(Serial1.read());
  }
}


