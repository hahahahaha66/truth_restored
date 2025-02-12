SECTION MBR vstart=0x7c00

; 初始化段寄存器
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov sp, 0x7c00
    mov ax, 0xb800
    mov gs, ax

; 清屏功能
    mov ax, 0x0600      ; 功能号 0x06
    mov bx, 0x0700       ; 黑底绿字
    mov cx, 0            ; 窗口左上角 (0, 0)
    mov dx, 0x184F   ; 窗口右下角 (80, 25)
    int 0x10

    mov byte [gs:0x00], '1'
    mov byte [gs:0x01], 0xA4

    mov byte [gs:0x02], ' '
    mov byte [gs:0x03], 0xA4

    mov byte [gs:0x04], 'M'
    mov byte [gs:0x05], 0xA4

    mov byte [gs:0x06], 'B'
    mov byte [gs:0x07], 0xA4

    mov byte [gs:0x08], 'R'
    mov byte [gs:0x09], 0xA4
    
    jmp $

    times 510-($-$$) db 0
    db 0x55, 0xAA