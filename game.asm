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

       chat db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')
            db 44 dup(' ')

    chatmsg db ' ',' ',' ',' ','Y','o','u',' ','c','a','n','t',' ','m','o','v','e',' ','t','h','e','r','e','!',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
            db ' ',' ',' ',' ','W','e','l','c','o','m','e',' ','t','o',' ','t','h','e',' ','g','a','m','e','!',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '


                     
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
    mov eax,1
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
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
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
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
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
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
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
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
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
     .if edx>23
         mov edx,0
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
    .if edx>23
        mov edx,0
        mov [esi],edx
        mov edx,24
    .else
        mov [esi],edx
    .endif
    dec edx
   
    mov esi,offset chat
    .while edx>0
        add esi,44
        sub edx,1
    .endw
    pop eax
    mov edx, offset chatmsg
    .while eax>0
        add edx,44
        sub eax,1
    .endw
    
    call writemsg

  

    ret
addmsg endp

writemsg proc ;chatline in [esi], msgtowrite in [edx]
    mov ecx,11
    WM1: push ecx
    mov eax,[edx]
    mov [esi],eax
    add edx,4
    add esi,4

    pop ecx
    sub ecx,1
    jnz WM1
    ret
writemsg endp

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
