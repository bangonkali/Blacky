
_main:

;Blacky.c,8 :: 		void main() {
;Blacky.c,9 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Blacky.c,10 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;Blacky.c,11 :: 		main_init();
	CALL        _main_init+0, 0
;Blacky.c,13 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;Blacky.c,14 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;Blacky.c,15 :: 		LATB = 0x00;
	CLRF        LATB+0 
;Blacky.c,16 :: 		LATD = 0;
	CLRF        LATD+0 
;Blacky.c,18 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Blacky.c,20 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Blacky.c,23 :: 		MoveForward (0);
	CLRF        FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,24 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,25 :: 		cycle_compass = 0;
	CLRF        _cycle_compass+0 
;Blacky.c,26 :: 		start = 0;
	CLRF        _start+0 
;Blacky.c,28 :: 		while(1){
L_main1:
;Blacky.c,29 :: 		err = ReadPing(&left, &front, &right);
	MOVLW       _left+0
	MOVWF       FARG_ReadPing_left+0 
	MOVLW       hi_addr(_left+0)
	MOVWF       FARG_ReadPing_left+1 
	MOVLW       _front+0
	MOVWF       FARG_ReadPing_front+0 
	MOVLW       hi_addr(_front+0)
	MOVWF       FARG_ReadPing_front+1 
	MOVLW       _right+0
	MOVWF       FARG_ReadPing_right+0 
	MOVLW       hi_addr(_right+0)
	MOVWF       FARG_ReadPing_right+1 
	CALL        _ReadPing+0, 0
	MOVF        R0, 0 
	MOVWF       _err+0 
	MOVF        R1, 0 
	MOVWF       _err+1 
;Blacky.c,31 :: 		transmit_rf(1);
	MOVLW       1
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,32 :: 		transmit_rf(left);
	MOVF        _left+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,33 :: 		transmit_rf(2);
	MOVLW       2
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,34 :: 		transmit_rf(right);
	MOVF        _right+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,35 :: 		transmit_rf(3);
	MOVLW       3
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,36 :: 		transmit_rf(front);
	MOVF        _front+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,37 :: 		transmit_rf(4);
	MOVLW       4
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,39 :: 		if (enable_compass > 0) {
	MOVF        _enable_compass+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Blacky.c,40 :: 		if (enable_compass == 1) {
	MOVF        _enable_compass+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Blacky.c,41 :: 		current_direction = ReadCompass(1, compass_current);
	MOVLW       1
	MOVWF       FARG_ReadCompass_send_serial+0 
	MOVLW       _compass_current+0
	MOVWF       FARG_ReadCompass_read_data+0 
	MOVLW       hi_addr(_compass_current+0)
	MOVWF       FARG_ReadCompass_read_data+1 
	CALL        _ReadCompass+0, 0
	MOVF        R0, 0 
	MOVWF       _current_direction+0 
;Blacky.c,42 :: 		} else if (enable_compass == 2) {
	GOTO        L_main5
L_main4:
	MOVF        _enable_compass+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Blacky.c,43 :: 		if (cycle_compass > COMPASS_SPARCE) {
	MOVF        _cycle_compass+0, 0 
	SUBLW       6
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;Blacky.c,44 :: 		current_direction = ReadCompass(1, compass_current);
	MOVLW       1
	MOVWF       FARG_ReadCompass_send_serial+0 
	MOVLW       _compass_current+0
	MOVWF       FARG_ReadCompass_read_data+0 
	MOVLW       hi_addr(_compass_current+0)
	MOVWF       FARG_ReadCompass_read_data+1 
	CALL        _ReadCompass+0, 0
	MOVF        R0, 0 
	MOVWF       _current_direction+0 
;Blacky.c,45 :: 		cycle_compass = 0;
	CLRF        _cycle_compass+0 
;Blacky.c,46 :: 		}
L_main7:
;Blacky.c,47 :: 		cycle_compass++;
	INCF        _cycle_compass+0, 1 
;Blacky.c,48 :: 		}
L_main6:
L_main5:
;Blacky.c,49 :: 		} else {
	GOTO        L_main8
L_main3:
;Blacky.c,50 :: 		transmit_rf(compass_initial[0]);
	MOVF        _compass_initial+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,51 :: 		transmit_rf(compass_initial[1]);
	MOVF        _compass_initial+1, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,52 :: 		transmit_rf(compass_initial[2]);
	MOVF        _compass_initial+2, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,53 :: 		}
L_main8:
;Blacky.c,55 :: 		transmit_rf(5);
	MOVLW       5
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,56 :: 		transmit_rf(start);
	MOVF        _start+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,57 :: 		transmit_rf(6);
	MOVLW       6
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,59 :: 		if (start > 0) {
	MOVF        _start+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main9
;Blacky.c,60 :: 		transmit_rf(compass_initial[0]);
	MOVF        _compass_initial+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,61 :: 		transmit_rf(compass_initial[1]);
	MOVF        _compass_initial+1, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,62 :: 		transmit_rf(compass_initial[2]);
	MOVF        _compass_initial+2, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,63 :: 		} else {
	GOTO        L_main10
L_main9:
;Blacky.c,64 :: 		transmit_rf(compass_current[0]);
	MOVF        _compass_current+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,65 :: 		transmit_rf(compass_current[1]);
	MOVF        _compass_current+1, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,66 :: 		transmit_rf(compass_current[2]);
	MOVF        _compass_current+2, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,67 :: 		}
L_main10:
;Blacky.c,69 :: 		transmit_rf(current_direction);
	MOVF        _current_direction+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,70 :: 		transmit_rf(initial_direction);
	MOVF        _initial_direction+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,72 :: 		if (start == 0) {
	MOVF        _start+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Blacky.c,73 :: 		configuration = read_rf(&temp);
	MOVLW       _temp+0
	MOVWF       FARG_read_rf_error+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       FARG_read_rf_error+1 
	CALL        _read_rf+0, 0
	MOVF        R0, 0 
	MOVWF       _configuration+0 
;Blacky.c,74 :: 		if (configuration > 0) {
	MOVF        R0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;Blacky.c,75 :: 		start = 1;
	MOVLW       1
	MOVWF       _start+0 
;Blacky.c,76 :: 		initial_direction = ReadCompass(0, compass_initial);
	CLRF        FARG_ReadCompass_send_serial+0 
	MOVLW       _compass_initial+0
	MOVWF       FARG_ReadCompass_read_data+0 
	MOVLW       hi_addr(_compass_initial+0)
	MOVWF       FARG_ReadCompass_read_data+1 
	CALL        _ReadCompass+0, 0
	MOVF        R0, 0 
	MOVWF       _initial_direction+0 
;Blacky.c,77 :: 		}
L_main12:
;Blacky.c,78 :: 		if (configuration == 1) {
	MOVF        _configuration+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Blacky.c,79 :: 		speed_veryfast = 0xFF; // should be max speed
	MOVLW       255
	MOVWF       _speed_veryfast+0 
;Blacky.c,80 :: 		speed_veryslow = 3;
	MOVLW       3
	MOVWF       _speed_veryslow+0 
;Blacky.c,81 :: 		enable_compass = 2; // sparce compass (every COMPASS_SPARCE cycle);
	MOVLW       2
	MOVWF       _enable_compass+0 
;Blacky.c,82 :: 		} else if (configuration == 2) {
	GOTO        L_main14
L_main13:
	MOVF        _configuration+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;Blacky.c,83 :: 		speed_veryfast = 0xFF; // should be max speed
	MOVLW       255
	MOVWF       _speed_veryfast+0 
;Blacky.c,84 :: 		speed_veryslow = 3;
	MOVLW       3
	MOVWF       _speed_veryslow+0 
;Blacky.c,85 :: 		enable_compass = 1; // compass reading after each cycle
	MOVLW       1
	MOVWF       _enable_compass+0 
;Blacky.c,86 :: 		} else if (configuration == 3) {
	GOTO        L_main16
L_main15:
	MOVF        _configuration+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;Blacky.c,87 :: 		speed_veryfast = 5;
	MOVLW       5
	MOVWF       _speed_veryfast+0 
;Blacky.c,88 :: 		speed_veryslow = 2;
	MOVLW       2
	MOVWF       _speed_veryslow+0 
;Blacky.c,89 :: 		enable_compass = 2; // sparce compass (every COMPASS_SPARCE cycle);
	MOVLW       2
	MOVWF       _enable_compass+0 
;Blacky.c,90 :: 		} else if (configuration == 4) {
	GOTO        L_main18
L_main17:
	MOVF        _configuration+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Blacky.c,91 :: 		speed_veryfast = 5;
	MOVLW       5
	MOVWF       _speed_veryfast+0 
;Blacky.c,92 :: 		speed_veryslow = 2;
	MOVLW       2
	MOVWF       _speed_veryslow+0 
;Blacky.c,93 :: 		enable_compass = 1; // compass reading after each cycle
	MOVLW       1
	MOVWF       _enable_compass+0 
;Blacky.c,94 :: 		} else if (configuration == 5) {
	GOTO        L_main20
L_main19:
	MOVF        _configuration+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Blacky.c,95 :: 		speed_veryfast = 0xFF;
	MOVLW       255
	MOVWF       _speed_veryfast+0 
;Blacky.c,96 :: 		speed_veryslow = 3; // should be max speed
	MOVLW       3
	MOVWF       _speed_veryslow+0 
;Blacky.c,97 :: 		enable_compass = 0; // no compass after each cycle
	CLRF        _enable_compass+0 
;Blacky.c,98 :: 		} else if (configuration == 6) {
	GOTO        L_main22
L_main21:
	MOVF        _configuration+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Blacky.c,99 :: 		speed_veryfast = 5;
	MOVLW       5
	MOVWF       _speed_veryfast+0 
;Blacky.c,100 :: 		speed_veryslow = 2;
	MOVLW       2
	MOVWF       _speed_veryslow+0 
;Blacky.c,101 :: 		enable_compass = 0; // no compass after each cycle
	CLRF        _enable_compass+0 
;Blacky.c,102 :: 		} else {
	GOTO        L_main24
L_main23:
;Blacky.c,103 :: 		speed_veryfast = 0;
	CLRF        _speed_veryfast+0 
;Blacky.c,104 :: 		speed_veryslow = 0;
	CLRF        _speed_veryslow+0 
;Blacky.c,105 :: 		enable_compass = 0; // no compass after each cycle
	CLRF        _enable_compass+0 
;Blacky.c,106 :: 		}
L_main24:
L_main22:
L_main20:
L_main18:
L_main16:
L_main14:
;Blacky.c,107 :: 		}
L_main11:
;Blacky.c,109 :: 		if (start > 0) {
	MOVF        _start+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;Blacky.c,110 :: 		if (front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
	MOVLW       0
	SUBWF       _front+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main77
	MOVLW       20
	SUBWF       _front+0, 0 
L__main77:
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
	MOVLW       0
	SUBWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main78
	MOVLW       20
	SUBWF       _right+0, 0 
L__main78:
	BTFSS       STATUS+0, 0 
	GOTO        L_main28
	MOVLW       0
	SUBWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main79
	MOVLW       20
	SUBWF       _left+0, 0 
L__main79:
	BTFSS       STATUS+0, 0 
	GOTO        L_main28
L__main75:
;Blacky.c,111 :: 		if (right > left) {
	MOVF        _right+1, 0 
	SUBWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main80
	MOVF        _right+0, 0 
	SUBWF       _left+0, 0 
L__main80:
	BTFSC       STATUS+0, 0 
	GOTO        L_main29
;Blacky.c,112 :: 		if(cycle_compass != COMPASS_SPARCE) {
	MOVF        _cycle_compass+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
;Blacky.c,113 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,114 :: 		} else {
	GOTO        L_main31
L_main30:
;Blacky.c,115 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,116 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
;Blacky.c,117 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,118 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
;Blacky.c,119 :: 		}
L_main31:
;Blacky.c,120 :: 		}  else {
	GOTO        L_main34
L_main29:
;Blacky.c,121 :: 		if(cycle_compass != COMPASS_SPARCE) {
	MOVF        _cycle_compass+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
;Blacky.c,122 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,123 :: 		} else {
	GOTO        L_main36
L_main35:
;Blacky.c,124 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,125 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
;Blacky.c,126 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,127 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	DECFSZ      R11, 1, 1
	BRA         L_main38
	NOP
;Blacky.c,128 :: 		}
L_main36:
;Blacky.c,129 :: 		}
L_main34:
;Blacky.c,130 :: 		} else if (right < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
	GOTO        L_main39
L_main28:
	MOVLW       0
	SUBWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main81
	MOVLW       20
	SUBWF       _right+0, 0 
L__main81:
	BTFSC       STATUS+0, 0 
	GOTO        L_main42
	MOVLW       0
	SUBWF       _front+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main82
	MOVLW       20
	SUBWF       _front+0, 0 
L__main82:
	BTFSC       STATUS+0, 0 
	GOTO        L_main42
	MOVLW       0
	SUBWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main83
	MOVLW       20
	SUBWF       _left+0, 0 
L__main83:
	BTFSS       STATUS+0, 0 
	GOTO        L_main42
L__main74:
;Blacky.c,131 :: 		if(cycle_compass != COMPASS_SPARCE) {
	MOVF        _cycle_compass+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
;Blacky.c,132 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,133 :: 		} else {
	GOTO        L_main44
L_main43:
;Blacky.c,134 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,135 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main45:
	DECFSZ      R13, 1, 1
	BRA         L_main45
	DECFSZ      R12, 1, 1
	BRA         L_main45
	DECFSZ      R11, 1, 1
	BRA         L_main45
;Blacky.c,136 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,137 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	DECFSZ      R11, 1, 1
	BRA         L_main46
	NOP
;Blacky.c,138 :: 		}
L_main44:
;Blacky.c,139 :: 		} else if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE) {
	GOTO        L_main47
L_main42:
	MOVLW       0
	SUBWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main84
	MOVLW       20
	SUBWF       _left+0, 0 
L__main84:
	BTFSC       STATUS+0, 0 
	GOTO        L_main50
	MOVLW       0
	SUBWF       _front+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main85
	MOVLW       20
	SUBWF       _front+0, 0 
L__main85:
	BTFSC       STATUS+0, 0 
	GOTO        L_main50
	MOVLW       0
	SUBWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main86
	MOVLW       20
	SUBWF       _right+0, 0 
L__main86:
	BTFSS       STATUS+0, 0 
	GOTO        L_main50
L__main73:
;Blacky.c,140 :: 		if(cycle_compass != COMPASS_SPARCE) {
	MOVF        _cycle_compass+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
;Blacky.c,141 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,142 :: 		} else {
	GOTO        L_main52
L_main51:
;Blacky.c,143 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,144 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
;Blacky.c,145 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,146 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
	NOP
;Blacky.c,148 :: 		}
L_main52:
;Blacky.c,149 :: 		} else if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right < MIN_SAFE_DISTANCE) {
	GOTO        L_main55
L_main50:
	MOVLW       0
	SUBWF       _left+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main87
	MOVLW       20
	SUBWF       _left+0, 0 
L__main87:
	BTFSC       STATUS+0, 0 
	GOTO        L_main58
	MOVLW       0
	SUBWF       _front+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main88
	MOVLW       20
	SUBWF       _front+0, 0 
L__main88:
	BTFSC       STATUS+0, 0 
	GOTO        L_main58
	MOVLW       0
	SUBWF       _right+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main89
	MOVLW       20
	SUBWF       _right+0, 0 
L__main89:
	BTFSC       STATUS+0, 0 
	GOTO        L_main58
L__main72:
;Blacky.c,150 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,151 :: 		} else if (front > MIN_SAFE_DISTANCE && left > MIN_SAFE_DISTANCE && right > MIN_SAFE_DISTANCE) {
	GOTO        L_main59
L_main58:
	MOVLW       0
	MOVWF       R0 
	MOVF        _front+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main90
	MOVF        _front+0, 0 
	SUBLW       20
L__main90:
	BTFSC       STATUS+0, 0 
	GOTO        L_main62
	MOVLW       0
	MOVWF       R0 
	MOVF        _left+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main91
	MOVF        _left+0, 0 
	SUBLW       20
L__main91:
	BTFSC       STATUS+0, 0 
	GOTO        L_main62
	MOVLW       0
	MOVWF       R0 
	MOVF        _right+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main92
	MOVF        _right+0, 0 
	SUBLW       20
L__main92:
	BTFSC       STATUS+0, 0 
	GOTO        L_main62
L__main71:
;Blacky.c,152 :: 		if(abs(initial_direction - current_direction) > 4) {
	MOVF        _current_direction+0, 0 
	SUBWF       _initial_direction+0, 0 
	MOVWF       FARG_abs_a+0 
	CLRF        FARG_abs_a+1 
	MOVLW       0
	SUBWFB      FARG_abs_a+1, 1 
	CALL        _abs+0, 0
	MOVLW       128
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main93
	MOVF        R0, 0 
	SUBLW       4
L__main93:
	BTFSC       STATUS+0, 0 
	GOTO        L_main63
;Blacky.c,153 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,154 :: 		} else {
	GOTO        L_main64
L_main63:
;Blacky.c,155 :: 		MoveForward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,156 :: 		}
L_main64:
;Blacky.c,157 :: 		} else if (front > MIN_SAFE_DISTANCE) {
	GOTO        L_main65
L_main62:
	MOVLW       0
	MOVWF       R0 
	MOVF        _front+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main94
	MOVF        _front+0, 0 
	SUBLW       20
L__main94:
	BTFSC       STATUS+0, 0 
	GOTO        L_main66
;Blacky.c,158 :: 		MoveForward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,159 :: 		} else {
	GOTO        L_main67
L_main66:
;Blacky.c,160 :: 		MoveBackward(speed_veryfast);
	MOVF        _speed_veryfast+0, 0 
	MOVWF       FARG_MoveBackward_speed+0 
	CALL        _MoveBackward+0, 0
;Blacky.c,161 :: 		Delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main68:
	DECFSZ      R13, 1, 1
	BRA         L_main68
	DECFSZ      R12, 1, 1
	BRA         L_main68
	DECFSZ      R11, 1, 1
	BRA         L_main68
;Blacky.c,162 :: 		}
L_main67:
L_main65:
L_main59:
L_main55:
L_main47:
L_main39:
;Blacky.c,163 :: 		}
L_main25:
;Blacky.c,165 :: 		if (test == 0) {
	MOVLW       0
	XORWF       _test+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main95
	MOVLW       0
	XORWF       _test+0, 0 
L__main95:
	BTFSS       STATUS+0, 2 
	GOTO        L_main69
;Blacky.c,166 :: 		LATB.B0 = 0x01;
	BSF         LATB+0, 0 
;Blacky.c,167 :: 		test = 1;
	MOVLW       1
	MOVWF       _test+0 
	MOVLW       0
	MOVWF       _test+1 
;Blacky.c,168 :: 		} else {
	GOTO        L_main70
L_main69:
;Blacky.c,169 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,170 :: 		LATB.B0 = 0x00;
	BCF         LATB+0, 0 
;Blacky.c,171 :: 		}
L_main70:
;Blacky.c,174 :: 		}
	GOTO        L_main1
;Blacky.c,175 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
