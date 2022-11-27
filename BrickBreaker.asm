dosseg

.model small
.stack 100h
.data
gameName db "Enter your Name: $"
num db 30
colour db 01010110b
mainMenu1 db "Start Game$"
mainMenu2 db "ScoreBoard$"
mainMenu3 db "Instructions$"
mainMenu4 db "Exit$"

playerName db 0

.code
main proc
mov ax, @data
mov ds, ax

call welcomePage
call mainMenuprint


mov ah,4ch
int 21h
main endp
clearscreen proc uses ax dx 
mov ah,6
mov al,0

mov cx,0
mov dh,80
mov dl,80
mov bh,00
int 10h
call BrickBreakerPrint
ret
clearscreen endp

mainMenuprint proc uses ax dx bx 

call clearscreen
;Vertical line 1
mov ah,6
mov al,0
mov BH,colour
mov ch,2  
mov cl,7  ;right
mov dh,15  ;down
mov dl,8  ;left
int 10h

;horizontal line 1
mov ah,6
mov al,0
mov BH,colour
mov ch,1  
mov cl,9  ;right
mov dh,1  ;down
mov dl,70  ;left
int 10h


;Printing Menus on the screen

;------------------Start Game--------------------------

mov ah,02h
mov bh,0
mov dh,19
mov dl,15
int 10h

mov dx,offset mainMenu1
mov ah,9
int 21h

;------------------Start Game--------------------------

mov ah,02h
mov bh,0
mov dh,19
mov dl,50
int 10h

mov dx,offset mainMenu2
mov ah,9
int 21h

;------------------Start Game--------------------------

mov ah,02h
mov bh,0
mov dh,25
mov dl,14
int 10h

mov dx,offset mainMenu3
mov ah,9
int 21h

;------------------Start Game--------------------------

mov ah,02h
mov bh,0
mov dh,25
mov dl,53
int 10h

mov dx,offset mainMenu4
mov ah,9
int 21h
ret
mainMenuprint endp
welcomePage proc
push ax
push bx
push cx
push dx
;setting Video Mode
mov ah,0
mov al,12h
int 10h
mov ax,0

;Setting Background Colour
mov ah,06h
xor al,al
xor cx,cx
mov dh,30
mov dl,80
mov bh,00h
int 10h

;horizontal line 1
mov ah,6
mov al,0
mov BH,colour
mov ch,1  
mov cl,9  ;right
mov dh,1  ;down
mov dl,70  ;left
int 10h

;horizontal line 2
;mov ah,6
;mov al,1
;mov BH,colour
;mov ch,0  
;mov cl,9  ;right
;mov dh,10  ;down
;mov dl,70  ;left
;int 10h

;Vertical line 1
mov ah,6
mov al,0
mov BH,colour
mov ch,2  
mov cl,7  ;right
mov dh,15  ;down
mov dl,8  ;left
int 10h

;Vertical line 2
;mov ah,6
;mov al,9
;mov BH,colour
;mov ch,0  
;mov cl,69  ;right
;mov dh,10  ;down
;mov dl,70  ;left
;int 10h


;setting Cursor
mov ah,02h
mov bh,0
mov dh,5
mov dl,33
int 10h

call BrickBreakerPrint

;setting the cursor position
mov ah,02h
mov bh,00h
mov dh,20  ;Row NUmber
mov dl,20  ;Column number
int 10h

;printing the message
mov dx,offset gameName
mov ah,9
int 21h
;setting the cursor position
mov ah,02h
mov bh,00h
mov dh,20  ;Row NUmber
mov dl,36  ;Column number
int 10h

call takeInput

pop dx
pop cx
pop bx
pop ax
ret
welcomePage endp
takeInput proc uses ax dx bx
mov si,offset playerName
repeat1:
mov ah,1
int 21h
cmp al,13
je done
mov [si],al
add si,1
jmp repeat1
done:
mov al,'$'
mov [si],al
ret
takeInput endp

BrickBreakerPrint proc uses dx cx bx ax
; Printing B
mov ah,6
mov al,5
mov BH,colour
mov ch,2  
mov cl, 12  ;right
mov dh,7  ;down
mov dl,12  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,7 
mov cl,12  ;right
mov dh,7  ;down
mov dl,15  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,5 
mov cl,12  ;right
mov dh,5  ;down
mov dl,15  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,3 
mov cl,12  ;right
mov dh,3  ;down
mov dl,15  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,4  
mov cl, 16  ;right
mov dh,4  ;down
mov dl,16  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,6  
mov cl, 16  ;right
mov dh,6  ;down
mov dl,16  ;left
int 10h

;printing R -----------------------------------------------------------

mov ah,6
mov al,5
mov BH,colour
mov ch,2  
mov cl,18  ;right
mov dh,7  ;down
mov dl,18  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,3 
mov cl,19  ;right
mov dh,3  ;down
mov dl,21  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,4  
mov cl, 22  ;right
mov dh,4  ;down
mov dl,22  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,5 
mov cl,19  ;right
mov dh,5  ;down
mov dl,21  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,6  
mov cl, 22  ;right
mov dh,7  ;down
mov dl,22  ;left
int 10h

;Printing I----------------------------------------
mov ah,6
mov al,0
mov BH,colour
mov ch,3  
mov cl,24  ;right
mov dh,7  ;down
mov dl,24  ;left
int 10h

;Printing C---------------------------------------------
mov ah,6
mov al,0
mov BH,colour
mov ch,4  
mov cl,26  ;right
mov dh,6  ;down
mov dl,27  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,3 
mov cl,28  ;right
mov dh,3  ;down
mov dl,30  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,7 
mov cl,28  ;right
mov dh,7  ;down
mov dl,30  ;left
int 10h

;Printing K----------------------------------------
mov ah,6
mov al,0
mov BH,colour
mov ch,3  
mov cl,32  ;right
mov dh,7  ;down
mov dl,32  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,5 
mov cl,33  ;right
mov dh,5  ;down
mov dl,34  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,4 
mov cl,35  ;right
mov dh,4 ;down
mov dl,36  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,3 
mov cl,37  ;right
mov dh,3 ;down
mov dl,38  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,6 
mov cl,35  ;right
mov dh,6  ;down
mov dl,36  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,7 
mov cl,37  ;right
mov dh,7  ;down
mov dl,38  ;left
int 10h



;Printing Breaker's B--------------------------------------
; Printing B
mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 26  ;right
mov dh,14  ;down
mov dl,26  ;left
int 10h


mov ah,6
mov al,0
mov BH,colour
mov ch,10 
mov cl,26  ;right
mov dh,10  ;down
mov dl,29  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12 
mov cl,26  ;right
mov dh,12  ;down
mov dl,29  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,14 
mov cl,26  ;right
mov dh,14  ;down
mov dl,29  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl,30  ;right
mov dh,11  ;down
mov dl,30  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,13  
mov cl, 30  ;right
mov dh,13  ;down
mov dl,30  ;left
int 10h

;printing R -----------------------------------------------------------

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 32  ;right
mov dh,14  ;down
mov dl,32  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 32  ;right
mov dh,10  ;down
mov dl,35  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 32  ;right
mov dh,12  ;down
mov dl,35  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl,36  ;right
mov dh,11  ;down
mov dl,36  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,13  
mov cl,36  ;right
mov dh,14  ;down
mov dl,36  ;left
int 10h

;printing E -----------------------------------------------------------

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 38  ;right
mov dh,14  ;down
mov dl,38  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 39  ;right
mov dh,10  ;down
mov dl,41  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 39  ;right
mov dh,12  ;down
mov dl,41  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,14  
mov cl, 39  ;right
mov dh,14  ;down
mov dl,41  ;left
int 10h

;printing A -----------------------------------------------------------

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 43  ;right
mov dh,14  ;down
mov dl,43  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl, 44  ;right
mov dh,11  ;down
mov dl,45  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 46  ;right
mov dh,10  ;down
mov dl,47  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl, 48  ;right
mov dh,11  ;down
mov dl,49  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 50  ;right
mov dh,14  ;down
mov dl,50  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,13  
mov cl, 43  ;right
mov dh,13  ;down
mov dl,50  ;left
int 10h

;printing K -----------------------------------------------------------

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 52  ;right
mov dh,14  ;down
mov dl,52  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 53  ;right
mov dh,12  ;down
mov dl,54  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 57  ;right
mov dh,10  ;down
mov dl,58  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl, 55  ;right
mov dh,11  ;down
mov dl,56  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,13  
mov cl, 55  ;right
mov dh,13  ;down
mov dl,56  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,14  
mov cl, 57  ;right
mov dh,14  ;down
mov dl,58  ;left
int 10h

;Printing E----------------------------------------------
mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 60  ;right
mov dh,14  ;down
mov dl,60  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 61  ;right
mov dh,10  ;down
mov dl,63  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 61  ;right
mov dh,12  ;down
mov dl,63  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,14  
mov cl, 61  ;right
mov dh,14  ;down
mov dl,63  ;left
int 10h

;Printing R----------------------------------------------
mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 65  ;right
mov dh,14  ;down
mov dl,65  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,10  
mov cl, 66  ;right
mov dh,10  ;down
mov dl,68  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,12  
mov cl, 66  ;right
mov dh,12  ;down
mov dl,68  ;left
int 10h

mov ah,6
mov al,0
mov BH,colour
mov ch,11  
mov cl, 69  ;right
mov dh,11  ;down
mov dl,69  ;left
int 10h


mov ah,6
mov al,0
mov BH,colour
mov ch,13  
mov cl, 69  ;right
mov dh,14  ;down
mov dl,69  ;left
int 10h
ret
BrickBreakerPrint endp

welcomePage endp
end main

