void setup() {
  // initialize serial:
  Serial.begin(9600);
  Serial1.begin(115200);
}

char prevHp = 'z';

void loop() {
  // print the string when a newline arrives:
  while (Serial1.available() ) {
    char h = Serial1.read();
    if (prevHp != h) {
      Serial.print(h);
      prevHp = h;
    } else {
      prevHp = h;
    }
  }
}


