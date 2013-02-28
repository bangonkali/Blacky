
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
;libPing.c,16 :: 		while (Echo_L == 1)
L_ReadPing_L3:
	BTFSS       Echo_L+0, BitPos(Echo_L+0) 
	GOTO        L_ReadPing_L4
;libPing.c,18 :: 		count_distance++;
	INFSNZ      ReadPing_L_count_distance_L0+0, 1 
	INCF        ReadPing_L_count_distance_L0+1, 1 
;libPing.c,20 :: 		}
	GOTO        L_ReadPing_L3
L_ReadPing_L4:
;libPing.c,21 :: 		return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
	MOVF        ReadPing_L_count_distance_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadPing_L_count_distance_L0+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        R1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVF        R2, 0 
	MOVWF       FARG_Count_Distance_cnt+2 
	MOVF        R3, 0 
	MOVWF       FARG_Count_Distance_cnt+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       122
	MOVWF       FARG_Count_Distance_max+2 
	MOVLW       137
	MOVWF       FARG_Count_Distance_max+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	MOVLW       127
	MOVWF       FARG_Count_Distance_scale+2 
	MOVLW       134
	MOVWF       FARG_Count_Distance_scale+3 
	CALL        _Count_Distance+0, 0
;libPing.c,22 :: 		}
L_end_ReadPing_L:
	RETURN      0
; end of _ReadPing_L

_ReadPing_R:

;libPing.c,24 :: 		int ReadPing_R() {
;libPing.c,25 :: 		int count_distance = 0;
	CLRF        ReadPing_R_count_distance_L0+0 
	CLRF        ReadPing_R_count_distance_L0+1 
;libPing.c,26 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;libPing.c,30 :: 		Trigger_R = 1;
	BSF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,31 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_R5:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_R5
;libPing.c,32 :: 		Trigger_R = 0;
	BCF         Trigger_R+0, BitPos(Trigger_R+0) 
;libPing.c,33 :: 		while (PORTD == 0)
L_ReadPing_R6:
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadPing_R7
;libPing.c,36 :: 		}
	GOTO        L_ReadPing_R6
L_ReadPing_R7:
;libPing.c,37 :: 		while (Echo_R == 1)
L_ReadPing_R8:
	BTFSS       Echo_R+0, BitPos(Echo_R+0) 
	GOTO        L_ReadPing_R9
;libPing.c,39 :: 		count_distance++;
	INFSNZ      ReadPing_R_count_distance_L0+0, 1 
	INCF        ReadPing_R_count_distance_L0+1, 1 
;libPing.c,41 :: 		}
	GOTO        L_ReadPing_R8
L_ReadPing_R9:
;libPing.c,42 :: 		return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
	MOVF        ReadPing_R_count_distance_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadPing_R_count_distance_L0+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        R1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVF        R2, 0 
	MOVWF       FARG_Count_Distance_cnt+2 
	MOVF        R3, 0 
	MOVWF       FARG_Count_Distance_cnt+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       122
	MOVWF       FARG_Count_Distance_max+2 
	MOVLW       137
	MOVWF       FARG_Count_Distance_max+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	MOVLW       127
	MOVWF       FARG_Count_Distance_scale+2 
	MOVLW       134
	MOVWF       FARG_Count_Distance_scale+3 
	CALL        _Count_Distance+0, 0
;libPing.c,43 :: 		}
L_end_ReadPing_R:
	RETURN      0
; end of _ReadPing_R

_ReadPing_F:

;libPing.c,45 :: 		int ReadPing_F() {
;libPing.c,46 :: 		int count_distance = 0;
	CLRF        ReadPing_F_count_distance_L0+0 
	CLRF        ReadPing_F_count_distance_L0+1 
;libPing.c,47 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;libPing.c,50 :: 		Trigger_F = 1;
	BSF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,51 :: 		Delay_us(20); // Delay 20us to wait for rising edge.
	MOVLW       13
	MOVWF       R13, 0
L_ReadPing_F10:
	DECFSZ      R13, 1, 1
	BRA         L_ReadPing_F10
;libPing.c,52 :: 		Trigger_F = 0;
	BCF         Trigger_F+0, BitPos(Trigger_F+0) 
;libPing.c,53 :: 		while (PORTD == 0)
L_ReadPing_F11:
	MOVF        PORTD+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadPing_F12
;libPing.c,56 :: 		}
	GOTO        L_ReadPing_F11
L_ReadPing_F12:
;libPing.c,57 :: 		while (Echo_F == 1)
L_ReadPing_F13:
	BTFSS       Echo_F+0, BitPos(Echo_F+0) 
	GOTO        L_ReadPing_F14
;libPing.c,59 :: 		count_distance++;
	INFSNZ      ReadPing_F_count_distance_L0+0, 1 
	INCF        ReadPing_F_count_distance_L0+1, 1 
;libPing.c,61 :: 		}
	GOTO        L_ReadPing_F13
L_ReadPing_F14:
;libPing.c,63 :: 		return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
	MOVF        ReadPing_F_count_distance_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadPing_F_count_distance_L0+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        R1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVF        R2, 0 
	MOVWF       FARG_Count_Distance_cnt+2 
	MOVF        R3, 0 
	MOVWF       FARG_Count_Distance_cnt+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_max+1 
	MOVLW       122
	MOVWF       FARG_Count_Distance_max+2 
	MOVLW       137
	MOVWF       FARG_Count_Distance_max+3 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+0 
	MOVLW       0
	MOVWF       FARG_Count_Distance_scale+1 
	MOVLW       127
	MOVWF       FARG_Count_Distance_scale+2 
	MOVLW       134
	MOVWF       FARG_Count_Distance_scale+3 
	CALL        _Count_Distance+0, 0
;libPing.c,64 :: 		}
L_end_ReadPing_F:
	RETURN      0
; end of _ReadPing_F

_Count_Distance:

;libPing.c,66 :: 		int Count_Distance(double cnt, double max, double scale) {
;libPing.c,67 :: 		if (cnt > max)
	MOVF        FARG_Count_Distance_cnt+0, 0 
	MOVWF       R4 
	MOVF        FARG_Count_Distance_cnt+1, 0 
	MOVWF       R5 
	MOVF        FARG_Count_Distance_cnt+2, 0 
	MOVWF       R6 
	MOVF        FARG_Count_Distance_cnt+3, 0 
	MOVWF       R7 
	MOVF        FARG_Count_Distance_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_Count_Distance_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_Count_Distance_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_Count_Distance_max+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Count_Distance15
;libPing.c,68 :: 		cnt = max;
	MOVF        FARG_Count_Distance_max+0, 0 
	MOVWF       FARG_Count_Distance_cnt+0 
	MOVF        FARG_Count_Distance_max+1, 0 
	MOVWF       FARG_Count_Distance_cnt+1 
	MOVF        FARG_Count_Distance_max+2, 0 
	MOVWF       FARG_Count_Distance_cnt+2 
	MOVF        FARG_Count_Distance_max+3, 0 
	MOVWF       FARG_Count_Distance_cnt+3 
L_Count_Distance15:
;libPing.c,70 :: 		return (int)(scale*(cnt/max));
	MOVF        FARG_Count_Distance_max+0, 0 
	MOVWF       R4 
	MOVF        FARG_Count_Distance_max+1, 0 
	MOVWF       R5 
	MOVF        FARG_Count_Distance_max+2, 0 
	MOVWF       R6 
	MOVF        FARG_Count_Distance_max+3, 0 
	MOVWF       R7 
	MOVF        FARG_Count_Distance_cnt+0, 0 
	MOVWF       R0 
	MOVF        FARG_Count_Distance_cnt+1, 0 
	MOVWF       R1 
	MOVF        FARG_Count_Distance_cnt+2, 0 
	MOVWF       R2 
	MOVF        FARG_Count_Distance_cnt+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FARG_Count_Distance_scale+0, 0 
	MOVWF       R4 
	MOVF        FARG_Count_Distance_scale+1, 0 
	MOVWF       R5 
	MOVF        FARG_Count_Distance_scale+2, 0 
	MOVWF       R6 
	MOVF        FARG_Count_Distance_scale+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
;libPing.c,71 :: 		}
L_end_Count_Distance:
	RETURN      0
; end of _Count_Distance
