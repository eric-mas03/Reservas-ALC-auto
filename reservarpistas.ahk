;Ignorad hasta el donde pone user := y contrasena :=, ahi poned cual de los dos de arriba se use

#SingleInstance Force
SetWorkingDir %A_ScriptDir%
if (not A_IsAdmin){
    Run *RunAs "%A_ScriptFullPath%" ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check  first.
}
#NoEnv   ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


;===========CUENTAS============+
user1 := "*****" ;		       |
contrasena1 := "*********"    ;|
user2 := "*****" ;		       |
contrasena2 := "******"       ;|
;==============================+

;====================================AJUSTES=====================================+
user := user1                ;Usuario correspondiente                            |
out := 0                                                                        ;|
window := "BlueStacks 5"                                                        ;|
ruta := "programm route" ;|
;================================================================================+

InputBox, day ,Inserta el dia que quieres reservar, Lunes = 1                                                                  Martes = 2                                                                        Miércoles = 3                                                                  Jueves = 4                                                                  Viernes = 5                                                                  Sábado = 6                                                                  Domingo = 7                                                                  DONDE SEA = 0, , , 250
sleep 1000

;User selector
if(user == user1){
    contrasena := contrasena1
    ;MsgBox, usuario 1: %user% con su contraseña: %contrasena%
}
else if(user == user2){
    contrasena := contrasena2
    ;MsgBox, usuario 2: %user% con su contraseña: %contrasena%
}

MouseClick, Left, 1845, 1068    ;Day Selector

    sleep 2000 
    PixelSearch, ax, ay, 252, 765, 1900, 1012, 0x996900, 5, RGB, Fast
    if(ErrorLevel == 0){
        findesemana := 1
        ;MsgBox, hoy es fin de semana
    }
    if(ErrorLevel == 1){
        findesemana := 0
        ;MsgBox, hoy es entre semana
    }

    MouseClick, Left, 1845, 1068


run, "https://reservas.megafincas.io/booking-online/megafincas-alc/login.php"
waiter()
login(user, contrasena)
sleep 5000
tabxtimes(2, 0)
tabxtimes(3, 0, 1900)
sleep 1000
send, {Pgdn}

while(out == 0) { ;Start search

    if(findesemana == 0){
        send, {Pgdn}
        sleep 1000
        while(out == 0){
            dayselector(day,findesemana)
            sleep 200
            send, {Pgdn}
        }
    }

    if(findesemana == 1){
        tabxtimes(6,0, 300)
        Loop{
            sleep 1500
            send, {Pgdn}
            sleep 500
            dayselector(day,findesemana)
            sleep 200
        }    
    }
}


refreshonweekend(){
    send, {Shift Down}
    sleep 100
    send, {TAB}
    sleep 10
    send, {Shift Up}
    sleep 10
    send, {Enter}
    sleep 200
    send, {Tab}
    sleep 10
    send, {Enter}
}

login(user, contrasena){
    tabxtimes(4, 1)
    send, %user%
    sleep 100
    send, {TAB}
    send, %contrasena%
    sleep 100
    send, {TAB}
    sleep 200
    send, {Enter}
}

tabxtimes(times,press = 0, sleeptime = 150){
    Loop %times%{
        send, {TAB}
    }
    sleep 10
    if(press == 0){
        send, {Enter}
    }
    sleep %time%
}

waiter(){
    found = 0
    contador = 0
    while(found == 0){
        PixelSearch, aax, aay, 0, 0, 500, 500, 0x0080FF,3, 5, RGB, Fast
        if(ErrorLevel == 0){
            sleep 2000
            found := 1
        }

        if(ErrorLevel == 1){
            sleep 100
            contador := contador + 100

            if(contador == 10000){
                send, {F5}
                contador2 := contador2 + 1
                contador := 0
            }

            if(contador2 == 3){
                MsgBox, Tiempo de espera agotado
                Break
                ExitApp
            }
        }
    }
}

dayselector(day,findesemana){
    if(day == 1){
        PixelSearch, ox, oy, 516, 640, 336, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }

    if(day == 2){
        PixelSearch, ox, oy, 660, 640, 532, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 3){
        PixelSearch, ox, oy, 869, 640, 713, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 4){
        PixelSearch, ox, oy, 1060, 640, 898, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 5){
        PixelSearch, ox, oy, 1230, 640, 1070, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 6){
        PixelSearch, ox, oy, 1400, 640, 1245, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 7){
        PixelSearch, ox, oy, 1570, 640, 1420, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
    if(day == 0){
        PixelSearch, ox, oy, 1570, 640, 0, 598, 0x3F9F3F, 5, RGB, Fast   ;Busca el color para reservar
        if(ErrorLevel == 0){
            reserva(ox, oy)
        }
        if(ErrorLevel == 1){
            if(findesemana == 0){
                send,{F5}
                sleep 700
            }
            if(findesemana == 1){
                refreshonweekend()
            }
        }
    }
}

reserva(ox, oy){
    MouseClick, Left, ox, oy 
    sleep 500
    MouseClick, Left, 1310, 283
    sleep 500
    MsgBox, Reservado con éxito!
}

^ESC::
ExitApp





