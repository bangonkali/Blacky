
_Skew:

;libBlacky.c,1 :: 		char Skew(int input, int maximum, int scaled_max) {
;libBlacky.c,2 :: 		if (input > maximum)
	MOVLW       128
	XORWF       FARG_Skew_maximum+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       FARG_Skew_input+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Skew2
	MOVF        FARG_Skew_input+0, 0 
	SUBWF       FARG_Skew_maximum+0, 0 
L__Skew2:
	BTFSC       STATUS+0, 0 
	GOTO        L_Skew0
;libBlacky.c,3 :: 		input = maximum;
	MOVF        FARG_Skew_maximum+0, 0 
	MOVWF       FARG_Skew_input+0 
	MOVF        FARG_Skew_maximum+1, 0 
	MOVWF       FARG_Skew_input+1 
L_Skew0:
;libBlacky.c,5 :: 		return (char)((double)scaled_max*((double)input/(double)maximum));
	MOVF        FARG_Skew_scaled_max+0, 0 
	MOVWF       R0 
	MOVF        FARG_Skew_scaled_max+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Skew+4 
	MOVF        R1, 0 
	MOVWF       FLOC__Skew+5 
	MOVF        R2, 0 
	MOVWF       FLOC__Skew+6 
	MOVF        R3, 0 
	MOVWF       FLOC__Skew+7 
	MOVF        FARG_Skew_input+0, 0 
	MOVWF       R0 
	MOVF        FARG_Skew_input+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Skew+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Skew+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Skew+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Skew+3 
	MOVF        FARG_Skew_maximum+0, 0 
	MOVWF       R0 
	MOVF        FARG_Skew_maximum+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__Skew+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Skew+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Skew+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Skew+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        FLOC__Skew+4, 0 
	MOVWF       R4 
	MOVF        FLOC__Skew+5, 0 
	MOVWF       R5 
	MOVF        FLOC__Skew+6, 0 
	MOVWF       R6 
	MOVF        FLOC__Skew+7, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Byte+0, 0
;libBlacky.c,6 :: 		}
L_end_Skew:
	RETURN      0
; end of _Skew
