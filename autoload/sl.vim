
let s:sl_string = [
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=    ||    ||    ||    |_____/~\\___/          |_D__D__D_|  |_D__D__D_| ",
\"  \\_/      \\_O=====O=====O=====O/      \\_/               \\_/   \\_/    \\_/   \\_/   ",
\],
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=   O=====O=====O=====O|_____/~\\___/          |_D__D__D_|  |_D__D__D_| ",
\"  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/               \\_/   \\_/    \\_/   \\_/      ",
\],
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-~O=====O=====O=====O\\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=    ||    ||    ||    |_____/~\\___/          |_D__D__D_|  |_D__D__D_|    ",
\"  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/               \\_/   \\_/    \\_/   \\_/         ",
\],
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-O=====O=====O=====O \\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=    ||    ||    ||    |_____/~\\___/          |_D__D__D_|  |_D__D__D_|    ",
\"  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/               \\_/   \\_/    \\_/   \\_/         ",
\],
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=O=====O=====O=====O   |_____/~\\___/          |_D__D__D_|  |_D__D__D_| ",
\"  \\_/      \\__/  \\__/  \\__/  \\__/      \\_/               \\_/   \\_/    \\_/   \\_/      ",
\],
\[
\"      ====        ________                ___________",
\"  _D _|  |_______/        \\__I_I_____===__|_________|",
\"   |(_)---  |   H\\________/ |   |        =|___ ___|      _________________ ",
\"   /     |  |   H  |  |     |   |         ||_| |_||     _|                \\_____A",
\"  |      |  |   H  |__--------------------| [___] |   =|                        |",
\"  | ________|___H__/__|_____/[][]~\\_______|       |   -|                        |",
\"  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_",
\"__/ =| o |=-~~\\  /~~\\  /~~\\  /~~\\ ____Y___________|__|__________________________|_ ",
\" |/-=|___|=    ||    ||    ||    |_____/~\\___/          |_D__D__D_|  |_D__D__D_| ",
\"  \\_/      \\O=====O=====O=====O_/      \\_/               \\_/   \\_/    \\_/   \\_/   ",
\],
\]


let s:smoke = [
\ ["    (   )","   (@@@)","      "," ( )","@"],
\ ["    (@@@)","        ","  (  )"," (@)","O"],
\ ["         ","   (   )","  (@@)"," ( )","@"],
\ ]

"uniform length of s:sl_string to 100
for i in range(0, len(s:sl_string)-1)
    for j in range(0, len(s:sl_string[i])-1)
        let sl_space = ""
        for k in range(1, 100-len(s:sl_string[i][j]))
            let sl_space .= " "
        endfor
        let s:sl_string[i][j] .= sl_space
    endfor
endfor

"uniform length of s:smoke to 100
for i in range(0, len(s:smoke)-1)
    for j in range(0, len(s:smoke[i])-1)
        let sm_bias = "        "
        let sm_space = ""
        for k in range(1, 100-len(s:smoke[i][j]))
            let sm_space .= " "
        endfor
        let s:smoke[i][j] = sm_bias . s:smoke[i][j] . sm_space
    endfor
endfor

function! s:oepn_close(open) abort
    if a:open == 1
        let s:old_cmdheight = &cmdheight
        if winheight(0) < 20+2
            let s:cheight = winheight(0)-2
        else
            let s:cheight = 20
        endif

        execute("set cmdheight=" . s:cheight)
    else
        execute("set cmdheight=" . s:old_cmdheight)
    endif
endfunction

function! s:cmd_clear() abort
    normal :
endfunction

function! s:set_height() abort
    let s:smoke_height = len(s:smoke[0])
    let s:sl_height = len(s:sl_string[0])
    if s:cheight < 10
        let s:smoke_height = 0
        let s:sl_height = s:cheight-2
    elseif s:cheight < 15
        let s:smoke_height = 0
    endif
endfunction


function! sl#run_sl() abort

    call s:oepn_close(1)

    call s:set_height()

    let s:wwidth = winwidth(0)
    for i in range(1, s:wwidth+80)
        if i == 1
            echomsg "sl"
        else
            let space = ""
            let rem = 0
            if i < s:wwidth-3
                for j in range(1, s:wwidth-3-i)
                    let space .= " "
                endfor
            else
                let rem = i-(s:wwidth-3)
            endif
            "print smoke
            for k in range(0, s:smoke_height-1)
                let print_smoke = space . s:smoke[i%3][k]
                echomsg print_smoke[rem:s:wwidth-3+rem]
            endfor
            "print sl
            for k in range(0, s:sl_height-1)
                let print_sl = space . s:sl_string[i%6][k]
                echomsg print_sl[rem:s:wwidth-3+rem]
            endfor
        endif
        sleep 50m
        call s:cmd_clear()
    endfor

    call s:oepn_close(0)
endfunction

