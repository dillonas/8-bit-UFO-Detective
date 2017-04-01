; ?????????????????????????????????????????????????????????????????????????
    include \masm32\include\masm32rt.inc
		include \masm32\macros\macros.asm
 
; ?????????????????????????????????????????????????????????????????????????

comment * -----------------------------------------------------
                     Build this console app with
                  "MAKEIT.BAT" on the PROJECT menu.
        ----------------------------------------------------- *

    .data?

		

		POINT STRUCT
			x DWORD ?
			y DWORD ?
		POINT ENDS
            INVENTORY STRUCT
			knife db 0
		INVENTORY ENDS

    .data
		
        cci CONSOLE_CURSOR_INFO <>
        chand dd ?
				
        old_pos POINT <1, 1>;
        pos POINT <1, 1>;
        inv INVENTORY<0>;
        last_direction POINT <1, 1>;
				
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
       	db ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','$','$',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','#'
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
            db ' ',' ',' ',' ','T','h','e',' ','o','l','d',' ','m','a','n',' ','g','i','v','e','s',' ','y','o','u',' ','a',' ','r','u','s','t','y',' ','k','n','i','f','e','.',' ',' ',' ',' '
            db ' ',' ',' ',' ','O','l','d',' ','M','a','n',':',' ','N','o','t',' ','w','a','n','t',' ','t','o',' ','t','a','l','k',' ','t','o',' ','m','e','?',' ',' ',' ',' ',' ',' ',' ',' '
            db ' ',' ',' ',' ','P','r','e','s','s',' ','1',' ','t','o',' ','T','a','l','k','.',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
            db ' ',' ',' ',' ','P','r','e','s','s',' ','2',' ','t','o',' ','L','e','a','v','e','.',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
    ;msgid,flags for new inv 
    event db 2,1,0,0,0,0,0,0,0
          db 3,0,0,0,0,0,0,0,0

           ;msgid,flags for new inv

    choices db 4,0,5,1,99,99,99,99
             
    .code

start:
   
; ?????????????????????????????????????????????????????????????????????????
    call main
    exit

; ?????????????????????????????????????????????????????????????????????????

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
    mov eax,0
    call interact
    
    call drawchat
    call drawinv
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
			
			dec ecx
			call getmapitem
			.if al == ' '
				dec pos.x
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
			.endif
			
			mov last_direction.x, -1
			mov last_direction.y, 0
		.elseif al == 72 && pos.y > 0
			; up
			mov ecx, pos.x
			mov edx, pos.y
			
			dec edx
			call getmapitem
			.if al == ' '
				dec pos.y
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
			.endif
			
			mov last_direction.x, 0
			mov last_direction.y, -1
		.elseif al == 77 && pos.x <= 62
			; right
			mov ecx, pos.x
			mov edx, pos.y
			
			inc ecx
			call getmapitem
			.if al == ' '
				inc pos.x
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
			.endif
			
			mov last_direction.x, 1
			mov last_direction.y, 0
		.elseif al == 80 && pos.y <= 22
			; down
			mov ecx, pos.x
			mov edx, pos.y
			
			inc edx
			call getmapitem
			.if al == ' '
				inc pos.y
                  .elseif
                    mov eax,0
                    call addmsg
                    call drawchat
			.endif
			
			mov last_direction.x, 0
			mov last_direction.y, 1
		.elseif al == 32
			mov ecx, pos.x
			mov edx, pos.y
			.if last_direction.x == -1
				dec ecx
			.elseif last_direction.x == 1
				inc ecx
			.endif
			.if last_direction.y == -1
				dec edx
			.elseif last_direction.y == 1
				inc edx
			.endif
			
			call getmapitem
			
			.if al == '$'
				loc 0,0
				print "$"
			.else
				loc 0,0
				print " "
			.endif
		.endif
		ret
get_input endp



interact proc
    mov esi,offset choices
    .while eax>0
        add esi,8
        sub eax,1
    .endw
    mov ecx,4
    I1: push ecx
    mov eax,[esi]
    and eax,000000ffh
    push esi
    .if eax<99
        call addmsg
        call drawchat
    .endif
    pop esi
    add esi,2
    pop ecx
    sub ecx,1
    jnz I1
    
    sub esi,7
    I2: push esi
    getkey
    .if eax==49
      pop esi
      mov ebx,[esi]
      push esi
      and ebx,000000ffh
      .if ebx < 99
        mov eax, ebx
        call execevent
        pop esi
        ret
      .endif
    .elseif eax==50
      pop esi
      add esi,2
      push esi
      mov ebx,[esi]
      and ebx,000000ffh
      .if ebx < 99
        mov eax, ebx
        call execevent
        pop esi
        ret
      .endif
      pop esi
      sub esi,2
      push esi
    .elseif eax==51
      pop esi
      add esi,4
      push esi
      mov ebx,[esi]
      and ebx,000000ffh
      .if ebx < 99
        mov eax, ebx
        call execevent
        pop esi
        ret
      .endif
      pop esi
      sub esi,4
      push esi
    .elseif eax==52
      pop esi
      add esi,6
      push esi
      mov ebx,[esi]
      and ebx,000000ffh
      .if ebx < 99     
        mov eax, ebx
        call execevent
        pop esi
        ret
      .endif
      pop esi
      sub esi,6
      push esi
    .endif
    pop esi
    jmp I2    
    
     
interact endp


execevent proc
    mov esi,offset event
    .while eax>0
        add esi,9
        sub eax,1
    .endw
    push esi
    mov eax,[esi]
    and eax,000000ffh
    call addmsg
    call drawchat
    pop esi
    add esi,1
    mov eax,[esi]
    and eax,000000ffh
    .if eax==1
      mov inv.knife,1
    .endif
    ret
execevent endp


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

drawinv proc
    loc 0,29
    print "Inventory: "
    
    .if inv.knife==1
        print "Rusty Knife"
    .endif
    ret
drawinv endp

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


; ?????????????????????????????????????????????????????????????????????????

end start
