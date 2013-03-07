
_SetSpeed:

;libMotor.c,3 :: 		void SetSpeed(unsigned char speed) {
;libMotor.c,4 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;libMotor.c,5 :: 		LATA = speed;
	MOVF        FARG_SetSpeed_speed+0, 0 
	MOVWF       LATA+0 
;libMotor.c,6 :: 		}
L_end_SetSpeed:
	RETURN      0
; end of _SetSpeed

_TurnLeft:

;libMotor.c,8 :: 		void TurnLeft() {
;libMotor.c,9 :: 		Turn (200, speed_veryslow, 0);
	MOVLW       200
	MOVWF       FARG_Turn_delay+0 
	MOVF        _speed_veryslow+0, 0 
	MOVWF       FARG_Turn_speed+0 
	CLRF        FARG_Turn_direction+0 
	CALL        _Turn+0, 0
;libMotor.c,10 :: 		}
L_end_TurnLeft:
	RETURN      0
; end of _TurnLeft

_TurnRight:

;libMotor.c,12 :: 		void TurnRight() {
;libMotor.c,13 :: 		Turn (200, speed_veryslow, 1);
	MOVLW       200
	MOVWF       FARG_Turn_delay+0 
	MOVF        _speed_veryslow+0, 0 
	MOVWF       FARG_Turn_speed+0 
	MOVLW       1
	MOVWF       FARG_Turn_direction+0 
	CALL        _Turn+0, 0
;libMotor.c,14 :: 		}
L_end_TurnRight:
	RETURN      0
; end of _TurnRight

_Turn:

;libMotor.c,16 :: 		void Turn(unsigned char delay, unsigned char speed, unsigned char direction) {
;libMotor.c,17 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;libMotor.c,18 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;libMotor.c,20 :: 		LATA = speed;
	MOVF        FARG_Turn_speed+0, 0 
	MOVWF       LATA+0 
;libMotor.c,21 :: 		if (direction) {
	MOVF        FARG_Turn_direction+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Turn0
;libMotor.c,22 :: 		LATB.B1 = 1;
	BSF         LATB+0, 1 
;libMotor.c,23 :: 		LATB.B2 = 0;
	BCF         LATB+0, 2 
;libMotor.c,25 :: 		LATB.B3 = 0;
	BCF         LATB+0, 3 
;libMotor.c,26 :: 		LATB.B4 = 0;
	BCF         LATB+0, 4 
;libMotor.c,27 :: 		} else {
	GOTO        L_Turn1
L_Turn0:
;libMotor.c,29 :: 		LATB.B1 = 0;
	BCF         LATB+0, 1 
;libMotor.c,30 :: 		LATB.B2 = 0;
	BCF         LATB+0, 2 
;libMotor.c,32 :: 		LATB.B3 = 0;
	BCF         LATB+0, 3 
;libMotor.c,33 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;libMotor.c,34 :: 		}
L_Turn1:
;libMotor.c,35 :: 		}
L_end_Turn:
	RETURN      0
; end of _Turn

_MoveForward:

;libMotor.c,37 :: 		void MoveForward (unsigned char speed) {
;libMotor.c,38 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;libMotor.c,39 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;libMotor.c,41 :: 		LATA = speed;
	MOVF        FARG_MoveForward_speed+0, 0 
	MOVWF       LATA+0 
;libMotor.c,43 :: 		LATB.B1 = 1;
	BSF         LATB+0, 1 
;libMotor.c,44 :: 		LATB.B2 = 0;
	BCF         LATB+0, 2 
;libMotor.c,46 :: 		LATB.B3 = 0;
	BCF         LATB+0, 3 
;libMotor.c,47 :: 		LATB.B4 = 1;
	BSF         LATB+0, 4 
;libMotor.c,48 :: 		}
L_end_MoveForward:
	RETURN      0
; end of _MoveForward

_MoveBackward:

;libMotor.c,50 :: 		void MoveBackward (unsigned char speed) {
;libMotor.c,51 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;libMotor.c,52 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;libMotor.c,54 :: 		LATA = speed;
	MOVF        FARG_MoveBackward_speed+0, 0 
	MOVWF       LATA+0 
;libMotor.c,56 :: 		LATB.B1 = 0;
	BCF         LATB+0, 1 
;libMotor.c,57 :: 		LATB.B2 = 1;
	BSF         LATB+0, 2 
;libMotor.c,59 :: 		LATB.B3 = 1;
	BSF         LATB+0, 3 
;libMotor.c,60 :: 		LATB.B4 = 0;
	BCF         LATB+0, 4 
;libMotor.c,61 :: 		}
L_end_MoveBackward:
	RETURN      0
; end of _MoveBackward
