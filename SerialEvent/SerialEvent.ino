char leveldetector_buffer[4];
char current_level;
char previous_level;
char previous_instantiated = 0;
char new_value = 0;
char sending = 0;
char previous;
char ctrlZ[] = "\x1A";

void setup() {
  
  
  // initialize serial:
  previous_instantiated = 0;
  
  
  Serial.begin(9600);
  Serial1.begin(9600);
  Serial2.begin(9600);
  Serial3.begin(9600);
  
  GSM_POWERON();
}

void GSM_POWERON() {
  pinMode(2, OUTPUT);
  digitalWrite(2, LOW);
  digitalWrite(2, HIGH);
  delay(1000);
  digitalWrite(2, LOW);
}

void NewData(char i) {
  new_value = 1;
  leveldetector_buffer[5]=leveldetector_buffer[4];
  leveldetector_buffer[4]=leveldetector_buffer[3];
  leveldetector_buffer[3]=leveldetector_buffer[2];
  leveldetector_buffer[2]=leveldetector_buffer[1];
  leveldetector_buffer[1]=leveldetector_buffer[0];
  leveldetector_buffer[0]=i;    
}

void loop() {
  if (new_value == 1) {
    if (
        leveldetector_buffer[4] == 'P' &&
        leveldetector_buffer[1] == ',' &&
        leveldetector_buffer[3] == ','
      ) {
        current_level = leveldetector_buffer[2];
        if (previous_instantiated == 0) {
          previous_instantiated = 1;
          previous_level = current_level;
        }
        
        if (previous_level != current_level) {
          if (current_level != previous && current_level != '0') {
            //Serial.write(current_level);
            GSM_POWERON();
            Serial.write("SENDING\n");
            sending = 1;
            Serial1.print("AT\r");
            delay(200);
            Serial1.print("AT+CMGF=1\r");
            delay(200);
            Serial1.print("AT+CMGS=\"+639157764387\"\r");
            delay(200);
            Serial1.print("");
            delay(200);
            Serial1.print("WATER VOLUME AT LEVEL " + String(current_level) + "\x1A");
            
            delay(200);
            sending = 0;
          }
          previous = current_level;
        }
        
        previous_level = current_level;
      }
  }
}

void serialEvent1(){
  while (Serial1.available() ) {
    Serial.write(Serial1.read());
  }
}

void serialEvent2(){
  if (sending == 0) {
    while (Serial2.available() ) {
      //Serial.write(Serial2.read());
      NewData(Serial2.read());
    }
  }
}

void serialEvent() {
  while (Serial.available()) {
    Serial1.write(Serial.read());
  }
}


//void serialEvent3(){
//  while (Serial3.available() ) {
//    Serial.write(Serial3.read());
//  }
//}

