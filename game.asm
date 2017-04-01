; �������������������������������������������������������������������������
    include \masm32\include\masm32rt.inc
		include \masm32\macros\macros.asm
 
; �������������������������������������������������������������������������

comment * -----------------------------------------------------
                     Build this console app with
                  "MAKEIT.BAT" on the PROJECT menu.
        ----------------------------------------------------- *

    .data?

		

		POINT STRUCT
			x DWORD ?
			y DWORD ?
		POINT ENDS

    .data
		
        cci CONSOLE_CURSOR_INFO <>
        chand dd ?
				
        old_pos POINT <1, 1>;
        pos POINT <1, 1>;
				
        map db '#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'
	      db '#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'
            db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#','a',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'
       	db '#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#','#'

    .code

start:
   
; �������������������������������������������������������������������������
    call main
    exit

; �������������������������������������������������������������������������

main proc

		;LOCAL pos :POINT
		
		invoke GetStdHandle, STD_OUTPUT_HANDLE
		mov chand, eax
		invoke GetConsoleCursorInfo, chand, addr cci
		mov cci.bVisible, FALSE
		invoke SetConsoleCursorInfo, chand, addr cci
		; hide the cursor
		
    call drawbg
    call drawmap
		
		.while 1
		  call drawplayer
		  call get_input
		.endw
		
    ;mov ecx,1
    ;mov edx,2
    ;call getmapitem
    ;printf("%c",eax)
		ret
main endp

get_input proc
		getkey
		
		mov edx, pos.x
		mov old_pos.x, edx
		mov edx, pos.y
		mov old_pos.y, edx
		
		.if al == 75 && pos.x > 0
			; left
			mov ecx, pos.x
			mov edx, pos.y
			;
			dec ecx
			call getmapitem
			.if al == ' '
				dec pos.x
			.endif
		.elseif al == 72 && pos.y > 0
			; up
			mov ecx, pos.x
			mov edx, pos.y
			;
			dec edx
			call getmapitem
			.if al == ' '
				dec pos.y
			.endif
		.elseif al == 77 && pos.x <= 62
			; right
			mov ecx, pos.x
			mov edx, pos.y
			;
			inc ecx
			call getmapitem
			.if al == ' '
				inc pos.x
			.endif
		.elseif al == 80 && pos.y <= 22
			; down
			mov ecx, pos.x
			mov edx, pos.y
			;
			inc edx
			call getmapitem
			.if al == ' '
				inc pos.y
			.endif
		.endif
		ret
get_input endp

getmapitem proc         ;x pos in ecx (0,63), y pos in edx(0,23)
    mov esi,offset map
    add esi,ecx
    .while edx>0
        add esi,64
        sub edx,1
    .endw
    mov eax,[esi]
    ret
getmapitem endp

drawbg proc
    loc 0,0
    cls
    print "                                                     MAIN TITLE                                                         "
    print "                                                                                                                        "
    print "                               GAME                                                      MESSAGES                       "
    print "  ------------------------------------------------------------------  ------------------------------------------------  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  |                                                                |  |                                              |  "
    print "  ------------------------------------------------------------------  ------------------------------------------------  "
    ret
drawbg endp

drawplayer proc

		mov edx, 4
		mov ecx, 3

		add edx, old_pos.y
		add ecx, old_pos.x
		
		loc ecx, edx
    print " "
		
    mov edx, 4
    mov ecx, 3
		
		add edx, pos.y
		add ecx, pos.x
		
		loc ecx, edx
    print "x"
		
		ret

drawplayer endp

drawmap proc
    mov esi, offset map
    mov edx, 4
    mov ecx, 24
    L1:
    push ecx
    push edx
    loc 3,edx
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    mov eax, [esi]
    printf("%c",eax);
    add esi,1
    pop edx
    pop ecx
    add edx,1
    sub ecx,1
    jnz L1
    ret
drawmap endp


; �������������������������������������������������������������������������

end start
