
_ReadPing_L:

;libPing.c,3 :: 		int ReadPing_L() {
;libPing.c,4 :: 		int count_distance = 0;
	CLRF        ReadPing_L_count_distance_L0+0 
	CLRF        ReadPing_L_count_distance_L0+1 
;libPing.c,5 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;libPing.c,9 :: 		Trigger_L = 0x01;
	BSF         Trigger_L+0, BitPos(Trigger_L+0) 
;libPing.c,10 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_L0:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_L0
;libPing.c,11 :: 		Trigger_L = 0x00;
	BCF         Trigger_L+0, BitPos(Trigger_L+0) 
;libPing.c,12 :: 		while (Echo_L == 0)
L_ReadPing_L1:
	BTFSC       Echo_L+0, BitPos(Echo_L+0) 
	GOTO        L_ReadPing_L2
;libPing.c,15 :: 		}
	GOTO        L_ReadPing_L1
L_ReadPing_L2:
;libPing.c,16 :: 		count_distance = 0;
	CLRF        ReadPing_L_count_distance_L0+0 
	CLRF        ReadPing_L_count_distance_L0+1 
;libPing.c,17 :: 		while (Echo_L == 1)
L_ReadPing_L3:
	BTFSS       Echo_L+0, BitPos(Echo_L+0) 
	GOTO        L_ReadPing_L4
;libPing.c,19 :: 		count_distance++;
	INFSNZ      ReadPing_L_count_distance_L0+0, 1 
	INCF        ReadPing_L_count_distance_L0+1, 1 
;libPing.c,21 :: 		}
	GOTO        L_ReadPing_L3
L_ReadPing_L4:
;libPing.c,22 :: 		return Count_Distance(count_distance, MaxDistance, MaxDistanceScaled);
	MOVF        ReadPing_L_count_distance_L0+0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        ReadPing_L_count_distance_L0+1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVLW       208
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       7
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       255
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	CALL        _Count_Distance+0, 0
;libPing.c,23 :: 		}
L_end_ReadPing_L:
	RETURN      0
; end of _ReadPing_L

_ReadPing_R:

;libPing.c,25 :: 		int ReadPing_R() {
;libPing.c,26 :: 		int count_distance = 0;
	CLRF        ReadPing_R_count_distance_L0+0 
	CLRF        ReadPing_R_count_distance_L0+1 
;libPing.c,27 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;libPing.c,31 :: 		Trigger_R = 1;
	BSF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,32 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_R5:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_R5
;libPing.c,33 :: 		Trigger_R = 0;
	BCF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,34 :: 		while (PORTD == 0)
L_ReadPing_R6:
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadPing_R7
;libPing.c,37 :: 		}
	GOTO        L_ReadPing_R6
L_ReadPing_R7:
;libPing.c,38 :: 		count_distance = 0;
	CLRF        ReadPing_R_count_distance_L0+0 
	CLRF        ReadPing_R_count_distance_L0+1 
;libPing.c,39 :: 		while (Echo_R == 1)
L_ReadPing_R8:
	BTFSS       Echo_R+0, BitPos(Echo_R+0) 
	GOTO        L_ReadPing_R9
;libPing.c,41 :: 		count_distance++;
	INFSNZ      ReadPing_R_count_distance_L0+0, 1 
	INCF        ReadPing_R_count_distance_L0+1, 1 
;libPing.c,43 :: 		}
	GOTO        L_ReadPing_R8
L_ReadPing_R9:
;libPing.c,44 :: 		return Count_Distance(count_distance, MaxDistance, MaxDistanceScaled);
	MOVF        ReadPing_R_count_distance_L0+0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        ReadPing_R_count_distance_L0+1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVLW       208
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       7
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       255
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	CALL        _Count_Distance+0, 0
;libPing.c,45 :: 		}
L_end_ReadPing_R:
	RETURN      0
; end of _ReadPing_R

_ReadPing_F:

;libPing.c,47 :: 		int ReadPing_F() {
;libPing.c,48 :: 		int count_distance = 0;
	CLRF        ReadPing_F_count_distance_L0+0 
	CLRF        ReadPing_F_count_distance_L0+1 
;libPing.c,49 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;libPing.c,52 :: 		Trigger_F = 1;
	BSF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,53 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_F10:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_F10
;libPing.c,54 :: 		Trigger_F = 0;
	BCF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,55 :: 		while (PORTD == 0)
L_ReadPing_F11:
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadPing_F12
;libPing.c,58 :: 		}
	GOTO        L_ReadPing_F11
L_ReadPing_F12:
;libPing.c,59 :: 		count_distance = 0;
	CLRF        ReadPing_F_count_distance_L0+0 
	CLRF        ReadPing_F_count_distance_L0+1 
;libPing.c,60 :: 		while (Echo_F == 1)
L_ReadPing_F13:
	BTFSS       Echo_F+0, BitPos(Echo_F+0) 
	GOTO        L_ReadPing_F14
;libPing.c,62 :: 		count_distance++;
	INFSNZ      ReadPing_F_count_distance_L0+0, 1 
	INCF        ReadPing_F_count_distance_L0+1, 1 
;libPing.c,64 :: 		}
	GOTO        L_ReadPing_F13
L_ReadPing_F14:
;libPing.c,66 :: 		return Count_Distance(count_distance, MaxDistance, MaxDistanceScaled);
	MOVF        ReadPing_F_count_distance_L0+0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        ReadPing_F_count_distance_L0+1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVLW       208
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       7
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       255
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	CALL        _Count_Distance+0, 0
;libPing.c,67 :: 		}
L_end_ReadPing_F:
	RETURN      0
; end of _ReadPing_F

_Count_Distance:

;libPing.c,69 :: 		int Count_Distance(int cnt, int max, int scale) {
;libPing.c,70 :: 		if (cnt > max)
	MOVLW       128
	XORWF       FARG_Count_Distance_max+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Count_Distance_cnt+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Count_Distance20
	MOVF        FARG_Count_Distance_cnt+0, 0 
	SUBWF       FARG_Count_Distance_max+0, 0 
L__Count_Distance20:
	BTFSC       STATUS+0, 0 
	GOTO        L_Count_Distance15
;libPing.c,71 :: 		cnt = max;
	MOVF        FARG_Count_Distance_max+0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        FARG_Count_Distance_max+1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
L_Count_Distance15:
;libPing.c,73 :: 		return (scale*cnt/max);
	MOVF        FARG_Count_Distance_scale+0, 0 
	MOVWF       R0 
	MOVF        FARG_Count_Distance_scale+1, 0 
	MOVWF       R1 
	MOVF        FARG_Count_Distance_cnt+0, 0 
	MOVWF       R4 
	MOVF        FARG_Count_Distance_cnt+1, 0 
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        FARG_Count_Distance_max+0, 0 
	MOVWF       R4 
	MOVF        FARG_Count_Distance_max+1, 0 
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
;libPing.c,74 :: 		}
L_end_Count_Distance:
	RETURN      0
; end of _Count_Distance
