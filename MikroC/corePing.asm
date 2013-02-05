
_ReadPing:

;corePing.c,4 :: 		int ReadPing(int *left, int *front, int *right)
;corePing.c,6 :: 		*left = ReadPing_L();
	CALL        _ReadPing_L+0, 0
	MOVFF       FARG_ReadPing_left+0, FSR1
	MOVFF       FARG_ReadPing_left+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;corePing.c,7 :: 		*front = ReadPing_F();
	CALL        _ReadPing_F+0, 0
	MOVFF       FARG_ReadPing_front+0, FSR1
	MOVFF       FARG_ReadPing_front+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;corePing.c,8 :: 		*right = ReadPing_R();
	CALL        _ReadPing_R+0, 0
	MOVFF       FARG_ReadPing_right+0, FSR1
	MOVFF       FARG_ReadPing_right+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;corePing.c,10 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;corePing.c,11 :: 		}
L_end_ReadPing:
	RETURN      0
; end of _ReadPing
