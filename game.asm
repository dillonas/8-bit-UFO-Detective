; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    include \masm32\include\masm32rt.inc
 
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

comment * -----------------------------------------------------
                     Build this console app with
                  "MAKEIT.BAT" on the PROJECT menu.
        ----------------------------------------------------- *

    .data?

    .data
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
   
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    call main
    getkey
    exit

; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

main proc



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
    ;mov ecx,1
    ;mov edx,2
    ;call getmapitem
    ;printf("%c",eax)


    ret

main endp

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


; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

end start
