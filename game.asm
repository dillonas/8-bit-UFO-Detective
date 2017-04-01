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
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
       	db '#',' ',' ',' ','#',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
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

     cindex db 5

       chat db 44 dup('a')
            db 44 dup('b')
            db 44 dup('c')
            db 44 dup('d')
            db 44 dup('e')
            db 44 dup('f')
            db 44 dup('g')
            db 44 dup('h')
            db 44 dup('i')
            db 44 dup('j')
            db 44 dup('k')
            db 44 dup('l')
            db 44 dup('m')
            db 44 dup('n')
            db 44 dup('o')
            db 44 dup('p')
            db 44 dup('q')
            db 44 dup('r')
            db 44 dup('s')
            db 44 dup('t')
            db 44 dup('u')
            db 44 dup('v')
            db 44 dup('w')
            db 44 dup('x')


                     
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

    call drawchat

    mov eax,0
    call addmsg
    mov eax,0
    call addmsg
    mov eax,0
    call addmsg
    mov eax,0
    call addmsg
    mov eax,0
    call addmsg
    call drawchat
		
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

drawchat proc
    mov esi, offset cindex
    mov edx,[esi]
    and edx,000000ffh
    
    

   mov ecx, 24
   DC1: push ecx
   push edx
 
     mov eax,24
 
     sub eax,ecx
     add eax,4
     loc 72,eax
     pop edx
     .if edx==24
         mov esi, offset chat
         sub edx,24
     .endif
     push edx
 
     call drawchatline
  
     

    pop edx
    add edx,1
    pop ecx
    sub ecx,1
    jnz DC1
    
    ret
    
drawchat endp

drawchatline proc
    mov esi, offset chat
    .while edx>0
        add esi,44
        sub edx,1
    .endw

    
    mov ecx,44
    DCL1: push ecx

    mov eax,[esi]
    printf("%c",eax)
    add esi,1

    
    pop ecx
    sub ecx,1
    jnz DCL1
    ret
drawchatline endp

addmsg proc ;msgid in eax
    push eax
    mov esi, offset cindex
    mov edx,[esi]
    and edx,000000ffh
    inc edx
    mov [esi],edx
    dec edx
    mov esi,offset chat
    .while edx>0
        add esi,44
        sub edx,1
    .endw
    pop eax
    .if eax==0
        mov eax,54534554h
        mov [esi],eax
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx
        add esi,4
        mov eax,20202020h
        mov [esi],ecx

    .endif

    ret
addmsg endp

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
