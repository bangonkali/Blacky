
_ReadPing_L:

;libPing.c,3 :: 		int ReadPing_L() {
;libPing.c,4 :: 		int count_distance = 0;
	CLRF        ReadPing_L_count_distance_L0+0 
	CLRF        ReadPing_L_count_distance_L0+1 
;libPing.c,6 :: 		Trigger_L = 1;
	BSF         Trigger_L+0, BitPos(Trigger_L+0) 
;libPing.c,7 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_L0:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_L0
;libPing.c,8 :: 		Trigger_L = 0;
	BCF         Trigger_L+0, BitPos(Trigger_L+0) 
;libPing.c,9 :: 		while (Echo_L == 0)
L_ReadPing_L1:
	BTFSC       Echo_L+0, BitPos(Echo_L+0) 
	GOTO        L_ReadPing_L2
;libPing.c,10 :: 		count_distance = 0;
	CLRF        ReadPing_L_count_distance_L0+0 
	CLRF        ReadPing_L_count_distance_L0+1 
	GOTO        L_ReadPing_L1
L_ReadPing_L2:
;libPing.c,11 :: 		while (Echo_L == 1)
L_ReadPing_L3:
	BTFSS       Echo_L+0, BitPos(Echo_L+0) 
	GOTO        L_ReadPing_L4
;libPing.c,13 :: 		count_distance++;
	INFSNZ      ReadPing_L_count_distance_L0+0, 1 
	INCF        ReadPing_L_count_distance_L0+1, 1 
;libPing.c,14 :: 		}
	GOTO        L_ReadPing_L3
L_ReadPing_L4:
;libPing.c,15 :: 		if (count_distance > MaxDistance)
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       ReadPing_L_count_distance_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadPing_L19
	MOVF        ReadPing_L_count_distance_L0+0, 0 
	SUBLW       232
L__ReadPing_L19:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadPing_L5
;libPing.c,16 :: 		count_distance = MaxDistance;
	MOVLW       232
	MOVWF       ReadPing_L_count_distance_L0+0 
	MOVLW       3
	MOVWF       ReadPing_L_count_distance_L0+1 
L_ReadPing_L5:
;libPing.c,18 :: 		count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        ReadPing_L_count_distance_L0+0, 0 
	MOVWF       R4 
	MOVF        ReadPing_L_count_distance_L0+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       ReadPing_L_count_distance_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadPing_L_count_distance_L0+1 
;libPing.c,19 :: 		return count_distance;
;libPing.c,20 :: 		}
L_end_ReadPing_L:
	RETURN      0
; end of _ReadPing_L

_ReadPing_R:

;libPing.c,22 :: 		int ReadPing_R() {
;libPing.c,23 :: 		int count_distance = 0;
	CLRF        ReadPing_R_count_distance_L0+0 
	CLRF        ReadPing_R_count_distance_L0+1 
;libPing.c,25 :: 		Trigger_R = 1;
	BSF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,26 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_R6:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_R6
;libPing.c,27 :: 		Trigger_R = 0;
	BCF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,28 :: 		while (Echo_R == 0)
L_ReadPing_R7:
	BTFSC       Echo_R+0, BitPos(Echo_R+0) 
	GOTO        L_ReadPing_R8
;libPing.c,29 :: 		count_distance = 0;
	CLRF        ReadPing_R_count_distance_L0+0 
	CLRF        ReadPing_R_count_distance_L0+1 
	GOTO        L_ReadPing_R7
L_ReadPing_R8:
;libPing.c,30 :: 		while (Echo_R == 1)
L_ReadPing_R9:
	BTFSS       Echo_R+0, BitPos(Echo_R+0) 
	GOTO        L_ReadPing_R10
;libPing.c,32 :: 		count_distance++;
	INFSNZ      ReadPing_R_count_distance_L0+0, 1 
	INCF        ReadPing_R_count_distance_L0+1, 1 
;libPing.c,33 :: 		}
	GOTO        L_ReadPing_R9
L_ReadPing_R10:
;libPing.c,34 :: 		if (count_distance > MaxDistance)
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       ReadPing_R_count_distance_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadPing_R21
	MOVF        ReadPing_R_count_distance_L0+0, 0 
	SUBLW       232
L__ReadPing_R21:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadPing_R11
;libPing.c,35 :: 		count_distance = MaxDistance;
	MOVLW       232
	MOVWF       ReadPing_R_count_distance_L0+0 
	MOVLW       3
	MOVWF       ReadPing_R_count_distance_L0+1 
L_ReadPing_R11:
;libPing.c,37 :: 		count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        ReadPing_R_count_distance_L0+0, 0 
	MOVWF       R4 
	MOVF        ReadPing_R_count_distance_L0+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       ReadPing_R_count_distance_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadPing_R_count_distance_L0+1 
;libPing.c,38 :: 		return count_distance;
;libPing.c,39 :: 		}
L_end_ReadPing_R:
	RETURN      0
; end of _ReadPing_R

_ReadPing_F:

;libPing.c,41 :: 		int ReadPing_F() {
;libPing.c,42 :: 		int count_distance = 0;
	CLRF        ReadPing_F_count_distance_L0+0 
	CLRF        ReadPing_F_count_distance_L0+1 
;libPing.c,44 :: 		Trigger_F = 1;
	BSF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,45 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_F12:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_F12
;libPing.c,46 :: 		Trigger_F = 0;
	BCF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,47 :: 		while (Echo_F == 0)
L_ReadPing_F13:
	BTFSC       Echo_F+0, BitPos(Echo_F+0) 
	GOTO        L_ReadPing_F14
;libPing.c,48 :: 		count_distance = 0;
	CLRF        ReadPing_F_count_distance_L0+0 
	CLRF        ReadPing_F_count_distance_L0+1 
	GOTO        L_ReadPing_F13
L_ReadPing_F14:
;libPing.c,49 :: 		while (Echo_F == 1)
L_ReadPing_F15:
	BTFSS       Echo_F+0, BitPos(Echo_F+0) 
	GOTO        L_ReadPing_F16
;libPing.c,51 :: 		count_distance++;
	INFSNZ      ReadPing_F_count_distance_L0+0, 1 
	INCF        ReadPing_F_count_distance_L0+1, 1 
;libPing.c,52 :: 		}
	GOTO        L_ReadPing_F15
L_ReadPing_F16:
;libPing.c,53 :: 		if (count_distance > MaxDistance)
	MOVLW       128
	XORLW       3
	MOVWF       R0 
	MOVLW       128
	XORWF       ReadPing_F_count_distance_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ReadPing_F23
	MOVF        ReadPing_F_count_distance_L0+0, 0 
	SUBLW       232
L__ReadPing_F23:
	BTFSC       STATUS+0, 0 
	GOTO        L_ReadPing_F17
;libPing.c,54 :: 		count_distance = MaxDistance;
	MOVLW       232
	MOVWF       ReadPing_F_count_distance_L0+0 
	MOVLW       3
	MOVWF       ReadPing_F_count_distance_L0+1 
L_ReadPing_F17:
;libPing.c,56 :: 		count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        ReadPing_F_count_distance_L0+0, 0 
	MOVWF       R4 
	MOVF        ReadPing_F_count_distance_L0+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       ReadPing_F_count_distance_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadPing_F_count_distance_L0+1 
;libPing.c,57 :: 		return count_distance;
;libPing.c,58 :: 		}
L_end_ReadPing_F:
	RETURN      0
; end of _ReadPing_F
