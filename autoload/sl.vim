
"read ascii art
source <sfile>:h/sl/ascii.vim

"uniform length of g:sl_string to 100
for s:i in range(0, len(g:sl_string)-1)
    for s:j in range(0, len(g:sl_string[s:i])-1)
        let s:sl_space = ""
        for s:k in range(1, 100-len(g:sl_string[s:i][s:j]))
            let s:sl_space .= " "
        endfor
        let g:sl_string[s:i][s:j] .= s:sl_space
    endfor
endfor

"uniform length of g:sl_smoke to 100
for s:i in range(0, len(g:sl_smoke)-1)
    for s:j in range(0, len(g:sl_smoke[s:i])-1)
        let s:sm_bias = "        "
        let s:sm_space = ""
        for s:k in range(1, 100-len(g:sl_smoke[s:i][s:j]))
            let s:sm_space .= " "
        endfor
        let g:sl_smoke[s:i][s:j] = s:sm_bias . g:sl_smoke[s:i][s:j] . s:sm_space
    endfor
endfor

function! s:oepn_close(open) abort
    if a:open == 1
        let s:old_cmdheight = &cmdheight
        if &lines < 20+2
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
    let s:smoke_height = len(g:sl_smoke[0])
    let s:sl_height = len(g:sl_string[0])
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

    let s:wwidth = &columns
    for i in range(1, s:wwidth+80)
        if i == 1
            echomsg "sl"
        else
            let l:space = ""
            let l:rem = 0
            if i < s:wwidth-3
                for j in range(1, s:wwidth-3-i)
                    let l:space .= " "
                endfor
            else
                let l:rem = i-(s:wwidth-3)
            endif
            "print sl_smoke
            for k in range(0, s:smoke_height-1)
                let l:print_smoke = l:space . g:sl_smoke[i%3][k]
                echomsg l:print_smoke[l:rem:s:wwidth-3+l:rem]
            endfor
            "print sl
            for k in range(0, s:sl_height-1)
                let print_sl = l:space . g:sl_string[i%6][k]
                echomsg print_sl[l:rem:s:wwidth-3+l:rem]
            endfor
        endif
        sleep 50m
        call s:cmd_clear()
    endfor

    call s:oepn_close(0)
endfunction

