
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
;Blacky.c,20 :: 		initial_direction = ReadCompass(0);
	CLRF        FARG_ReadCompass+0 
	CALL        _ReadCompass+0, 0
	MOVF        R0, 0 
	MOVWF       _initial_direction+0 
	MOVF        R1, 0 
	MOVWF       _initial_direction+1 
;Blacky.c,22 :: 		Delay_ms(100);
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
;Blacky.c,23 :: 		MoveForward (7);
	MOVLW       7
	MOVWF       FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,24 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,26 :: 		start = 1;
	MOVLW       1
	MOVWF       _start+0 
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
;Blacky.c,38 :: 		current_direction = ReadCompass(1);
	MOVLW       1
	MOVWF       FARG_ReadCompass+0 
	CALL        _ReadCompass+0, 0
	MOVF        R0, 0 
	MOVWF       _current_direction+0 
	MOVF        R1, 0 
	MOVWF       _current_direction+1 
;Blacky.c,39 :: 		transmit_rf(5);
	MOVLW       5
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,40 :: 		transmit_rf(start);
	MOVF        _start+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,41 :: 		transmit_rf(6);
	MOVLW       6
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;Blacky.c,43 :: 		if (start != 0) {
	MOVF        _start+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;Blacky.c,44 :: 		if (front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
	MOVLW       128
	XORWF       _front+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVLW       25
	SUBWF       _front+0, 0 
L__main36:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	MOVLW       128
	XORWF       _right+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVLW       25
	SUBWF       _right+0, 0 
L__main37:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
	MOVLW       128
	XORWF       _left+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       25
	SUBWF       _left+0, 0 
L__main38:
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
L__main34:
;Blacky.c,45 :: 		if (right > left) {
	MOVLW       128
	XORWF       _left+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _right+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVF        _right+0, 0 
	SUBWF       _left+0, 0 
L__main39:
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;Blacky.c,46 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,47 :: 		}  else {
	GOTO        L_main8
L_main7:
;Blacky.c,48 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,49 :: 		}
L_main8:
;Blacky.c,50 :: 		}
L_main6:
;Blacky.c,52 :: 		if (right < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
	MOVLW       128
	XORWF       _right+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main40
	MOVLW       25
	SUBWF       _right+0, 0 
L__main40:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
	MOVLW       128
	XORWF       _front+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main41
	MOVLW       25
	SUBWF       _front+0, 0 
L__main41:
	BTFSC       STATUS+0, 0 
	GOTO        L_main11
	MOVLW       128
	XORWF       _left+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main42
	MOVLW       25
	SUBWF       _left+0, 0 
L__main42:
	BTFSS       STATUS+0, 0 
	GOTO        L_main11
L__main33:
;Blacky.c,53 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,54 :: 		}
L_main11:
;Blacky.c,56 :: 		if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE) {
	MOVLW       128
	XORWF       _left+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVLW       25
	SUBWF       _left+0, 0 
L__main43:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       128
	XORWF       _front+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main44
	MOVLW       25
	SUBWF       _front+0, 0 
L__main44:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       128
	XORWF       _right+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main45
	MOVLW       25
	SUBWF       _right+0, 0 
L__main45:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
L__main32:
;Blacky.c,57 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,58 :: 		}
L_main14:
;Blacky.c,60 :: 		if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right < MIN_SAFE_DISTANCE) {
	MOVLW       128
	XORWF       _left+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main46
	MOVLW       25
	SUBWF       _left+0, 0 
L__main46:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	MOVLW       128
	XORWF       _front+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVLW       25
	SUBWF       _front+0, 0 
L__main47:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	MOVLW       128
	XORWF       _right+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       25
	SUBWF       _right+0, 0 
L__main48:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
L__main31:
;Blacky.c,61 :: 		MoveForward(0);
	CLRF        FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,62 :: 		}
L_main17:
;Blacky.c,64 :: 		if (left > MIN_SAFE_DISTANCE && front > MIN_SAFE_DISTANCE && right > MIN_SAFE_DISTANCE) {
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _left+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVF        _left+0, 0 
	SUBLW       25
L__main49:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _front+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVF        _front+0, 0 
	SUBLW       25
L__main50:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _right+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVF        _right+0, 0 
	SUBLW       25
L__main51:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
L__main30:
;Blacky.c,65 :: 		if (initial_direction > current_direction) {
	MOVLW       128
	XORWF       _current_direction+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _initial_direction+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main52
	MOVF        _initial_direction+0, 0 
	SUBWF       _current_direction+0, 0 
L__main52:
	BTFSC       STATUS+0, 0 
	GOTO        L_main21
;Blacky.c,66 :: 		if (initial_direction - current_direction > 180) {
	MOVF        _current_direction+0, 0 
	SUBWF       _initial_direction+0, 0 
	MOVWF       R1 
	MOVF        _current_direction+1, 0 
	SUBWFB      _initial_direction+1, 0 
	MOVWF       R2 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	MOVF        R1, 0 
	SUBLW       180
L__main53:
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
;Blacky.c,67 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,68 :: 		} else {
	GOTO        L_main23
L_main22:
;Blacky.c,69 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,70 :: 		}
L_main23:
;Blacky.c,71 :: 		} else if (current_direction > initial_direction) {
	GOTO        L_main24
L_main21:
	MOVLW       128
	XORWF       _initial_direction+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _current_direction+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	MOVF        _current_direction+0, 0 
	SUBWF       _initial_direction+0, 0 
L__main54:
	BTFSC       STATUS+0, 0 
	GOTO        L_main25
;Blacky.c,72 :: 		if (current_direction - initial_direction > 180) {
	MOVF        _initial_direction+0, 0 
	SUBWF       _current_direction+0, 0 
	MOVWF       R1 
	MOVF        _initial_direction+1, 0 
	SUBWFB      _current_direction+1, 0 
	MOVWF       R2 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVF        R1, 0 
	SUBLW       180
L__main55:
	BTFSC       STATUS+0, 0 
	GOTO        L_main26
;Blacky.c,73 :: 		TurnLeft();
	CALL        _TurnLeft+0, 0
;Blacky.c,74 :: 		} else {
	GOTO        L_main27
L_main26:
;Blacky.c,75 :: 		TurnRight();
	CALL        _TurnRight+0, 0
;Blacky.c,76 :: 		}
L_main27:
;Blacky.c,77 :: 		}
L_main25:
L_main24:
;Blacky.c,79 :: 		MoveForward(DEFAULT_SPEED);
	MOVLW       15
	MOVWF       FARG_MoveForward_speed+0 
	CALL        _MoveForward+0, 0
;Blacky.c,80 :: 		}
L_main20:
;Blacky.c,81 :: 		}
L_main3:
;Blacky.c,83 :: 		if (test == 0) {
	MOVLW       0
	XORWF       _test+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVLW       0
	XORWF       _test+0, 0 
L__main56:
	BTFSS       STATUS+0, 2 
	GOTO        L_main28
;Blacky.c,84 :: 		LATB.B0 = 0x01;
	BSF         LATB+0, 0 
;Blacky.c,85 :: 		test = 1;
	MOVLW       1
	MOVWF       _test+0 
	MOVLW       0
	MOVWF       _test+1 
;Blacky.c,86 :: 		} else {
	GOTO        L_main29
L_main28:
;Blacky.c,87 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,88 :: 		LATB.B0 = 0x00;
	BCF         LATB+0, 0 
;Blacky.c,89 :: 		}
L_main29:
;Blacky.c,92 :: 		}
	GOTO        L_main1
;Blacky.c,93 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
