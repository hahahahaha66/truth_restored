SECTION MBR vstart=0x7c00

; 初始化段寄存器
    mov ax, cs
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov fs, ax
    mov sp, 0x7c00

; 清屏功能
    mov ax, 0x0600       ; 功能号 0x06
    mov bx, 0x700        ; 黑底绿字
    mov cx, 0            ; 窗口左上角 (0, 0)
    mov dx, 0x184f       ; 窗口右下角 (80, 25)
    int 0x10             ; BIOS 中断调用

; 获取光标位置
    mov ah, 0x03         ; 功能号 0x03
    mov bh, 0            ; 当前页号
    int 0x10             ; BIOS 中断调用

; 打印字符串
    mov ax, message
    mov bp, ax           ; es:bp 指向字符串
    mov cx, 5            ; 字符串长度（不包括结束符）
    mov ax, 0x1301       ; 功能号 0x13，AL=01（显示字符串并移动光标）
    mov bx, 0x2          ; 属性：黑底绿字
    int 0x10             ; BIOS 中断调用

; 程序悬停
    jmp $

; 数据段
message db "1 MBR"
times 510-($-$$) db 0
db 0x55, 0xaa
