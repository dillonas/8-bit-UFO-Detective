; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    include \masm32\include\masm32rt.inc
 
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

comment * -----------------------------------------------------
                     Build this console app with
                  "MAKEIT.BAT" on the PROJECT menu.
        ----------------------------------------------------- *

    .data?

    .data
map
                                                   
    .code

start:
   
; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
    call main
    inkey
    exit

; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

main proc



    call drawbg
    call drawmap
    ret

main endp

drawmap proc

    
drawmap endp


drawdd proc
    push ecx
    mov ecx,8
    DD1: push ecx
    mov eax,[esi+ebx]
    mov edx,eax
    and edx,0000000fh
    .if edx==0
     print " "
    .elseif edx==1
      print "#"
    .endif
    shl eax,4
    pop ecx
    sub ecx,1
    .if ecx==0
      pop ecx
      ret 4
    .else
      jmp DD1
    .endif
drawdd endp

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

; ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤

end start
