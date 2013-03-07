
_Skew:

;libBlacky.c,1 :: 		unsigned int Skew(double cnt, double max, double scale) {
;libBlacky.c,2 :: 		if (cnt > max)
	MOVF        FARG_Skew_cnt+0, 0 
	MOVWF       R4 
	MOVF        FARG_Skew_cnt+1, 0 
	MOVWF       R5 
	MOVF        FARG_Skew_cnt+2, 0 
	MOVWF       R6 
	MOVF        FARG_Skew_cnt+3, 0 
	MOVWF       R7 
	MOVF        FARG_Skew_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_Skew_max+1, 0 
	MOVWF       R1 
	MOVF        FARG_Skew_max+2, 0 
	MOVWF       R2 
	MOVF        FARG_Skew_max+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Skew0
;libBlacky.c,3 :: 		cnt = max;
	MOVF        FARG_Skew_max+0, 0 
	MOVWF       FARG_Skew_cnt+0 
	MOVF        FARG_Skew_max+1, 0 
	MOVWF       FARG_Skew_cnt+1 
	MOVF        FARG_Skew_max+2, 0 
	MOVWF       FARG_Skew_cnt+2 
	MOVF        FARG_Skew_max+3, 0 
	MOVWF       FARG_Skew_cnt+3 
L_Skew0:
;libBlacky.c,5 :: 		return (unsigned int)(scale*(cnt/max));
	MOVF        FARG_Skew_max+0, 0 
	MOVWF       R4 
	MOVF        FARG_Skew_max+1, 0 
	MOVWF       R5 
	MOVF        FARG_Skew_max+2, 0 
	MOVWF       R6 
	MOVF        FARG_Skew_max+3, 0 
	MOVWF       R7 
	MOVF        FARG_Skew_cnt+0, 0 
	MOVWF       R0 
	MOVF        FARG_Skew_cnt+1, 0 
	MOVWF       R1 
	MOVF        FARG_Skew_cnt+2, 0 
	MOVWF       R2 
	MOVF        FARG_Skew_cnt+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FARG_Skew_scale+0, 0 
	MOVWF       R4 
	MOVF        FARG_Skew_scale+1, 0 
	MOVWF       R5 
	MOVF        FARG_Skew_scale+2, 0 
	MOVWF       R6 
	MOVF        FARG_Skew_scale+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Word+0, 0
;libBlacky.c,6 :: 		}
L_end_Skew:
	RETURN      0
; end of _Skew
