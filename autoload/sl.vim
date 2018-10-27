
"read ascii art
source <sfile>:h/sl/ascii.vim

let s:sl_ori_h = len(g:sl_string[0])
let s:sm_ori_h = len(g:sl_smoke[0])
let s:bg_ori_h = 10
let s:all_h    = s:sl_ori_h + s:bg_ori_h

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
        " set command height.
        let s:old_cmdheight = &cmdheight
        " 2 ... height bias
        " 3 ... lines - max cmdheight (laststatus=2)
        if &lines < s:sl_ori_h+2+3
            "unable to show full SL.
            let s:cheight = &lines-3
        elseif &lines < s:sl_ori_h+s:sm_ori_h+2+3
            " unable to show smoke.
            let s:cheight = s:sl_ori_h+2
        elseif &lines < s:all_h+2+3
            " unable to show background.
            let s:cheight = s:sl_ori_h+s:sm_ori_h+2
        else
            let s:cheight = s:all_h+2
        endif
        "disable Ctrl-C.
        noremap <c-c> <Nop>

        execute("set cmdheight=" . s:cheight)
    else
        "tempolary
        unmap <c-c>
        execute("set cmdheight=" . s:old_cmdheight)
    endif
endfunction

function! s:options(opt) abort

    let s:opt_tab = 0
    let s:opt_fast = 0

    if a:opt["0"] == 0
        return
    else
        for i in range(1, a:opt["0"])
            let l:optn = a:opt[printf("%d",i)]
            if l:optn[0] == "-"
                for j in range(1, len(l:optn)-1)
                    let o = l:optn[j]
                    if o == "t"
                        let s:opt_tab = 1
                    elseif o == "f"
                        let s:opt_fast = 1
                    endif
                endfor
            endif
        endfor
    endif
endfunction

function! s:cmd_clear() abort
    normal! :
    "execute("normal \<c-l>")
endfunction

function! s:set_height() abort

    let s:no_smoke = 0
    if s:opt_tab == 1
        let s:with_back = 1
    else
        let s:with_back = 0
    endif

    let s:sl_height = len(g:sl_string[0]) + len(g:sl_smoke[0])
    if s:cheight < s:sl_ori_h+2
        " unable to show full SL
        let s:no_smoke = 1
        let s:with_back = 0
        let s:sl_height = s:cheight-2
    elseif s:cheight < s:sl_ori_h+s:sm_ori_h+2
        " unable to show smoke
        let s:no_smoke = 1
        let s:with_back = 0
        let s:sl_height = len(g:sl_string[0])
    elseif s:cheight == s:sl_ori_h+s:sm_ori_h+2
        let s:with_back = 0
    endif
endfunction

function! s:set_back_width(backgd) abort
    " fit background width to columns.
    let l:qu = s:wwidth/len(a:backgd[0])
    let l:rem = s:wwidth%len(a:backgd[0])
    let l:bg = []
    for i in range(0, len(a:backgd)-1)
        let l:tmp_str = ""
        for j in range(0, qu-1)
            let l:tmp_str .= a:backgd[i]
        endfor
        let l:tmp_str .= a:backgd[i][:l:rem]
        let l:bg += [l:tmp_str]
    endfor
    return l:bg

endfunction

function! s:superimpose_strs(front_str, back_str) abort
    let l:lf = len(a:front_str)
    let l:lb = len(a:back_str)

    let l:re_str = ""
    for i in range(0, l:lb-1)
        "exist front string
        if i < l:lf
            if a:front_str[i] == " "
                let l:re_str .= a:back_str[i]
            else
                let l:re_str .= a:front_str[i]
            endif
        else
            let l:re_str .= a:back_str[i]
        endif
    endfor

    return l:re_str
endfunction

function! s:echo_sl(str_sl, idx) abort
    let l:str_len = len(a:str_sl)
    " with background
    if s:with_back != 0
        let l:bg = s:set_back_width(g:sl_background[a:idx])
        for i in range(0, l:str_len-1)
            "echo l:bg[i]
            if i < len(l:bg)
                echo s:superimpose_strs(a:str_sl[i], l:bg[i])
            else
                echo a:str_sl[i]
            endif
        endfor
    " without background
    else
        for i in range(0, l:str_len-1)
            echo a:str_sl[i]
        endfor
    endif
endfunction

function! s:run_sl_main() abort

    "" set sl height and some optinos.
    call s:set_height()
    
    " prepare spacer for height bias.
    let l:tmp_space = ""
    for k in range(0, s:wwidth)
        let l:tmp_space .= " "
    endfor

    for i in range(1, s:wwidth+80)
        if i == 1
            " dummy
            echomsg "sl"
        else
            let l:space = ""
            let l:rem = 0
            " add space.
            if i < s:wwidth
                for j in range(1, s:wwidth-i)
                    let l:space .= " "
                endfor
            " reach left end.
            else
                let l:rem = i-(s:wwidth)
            endif
            "prepare sl string.
            if s:no_smoke == 0
                let l:sl_all = g:sl_smoke[i%3] + g:sl_string[i%6]
            else
                let l:sl_all = g:sl_string[i%6]
            endif
            let l:print_sl = []
            if s:cheight == s:all_h+2
                " add spacer
                let g:test = s:cheight - s:sl_height
                for k in range(0, s:bg_ori_h-s:sm_ori_h-1)
                    let l:print_sl += [l:tmp_space]
                endfor
            endif
            for k in range(0, s:sl_height-1)
                let l:add_str = (l:space . l:sl_all[k])[l:rem:s:wwidth+l:rem]
                let l:print_sl += [ l:add_str ]
            endfor
            "print sl.
            let l:idx = (line("$")+s:tn+s:sec)%len(g:sl_background)
            call s:echo_sl(l:print_sl, l:idx)
        endif
        if s:opt_fast == 1
            sleep 10m
        else
            sleep 50m
        endif
        call s:cmd_clear()
    endfor

endfunction


function! sl#run_sl(...) abort

    if s:bg_ori_h < s:sm_ori_h
        echohl Error | echo " smoke too long!" | echohl None
        return
    endif

    " width bias.
    let s:win_minus = 3

    let s:wwidth = &columns - s:win_minus
    " set option information.

    call s:options(a:)

    if s:opt_tab == 1
        let l:TabNrs = range(1, tabpagenr("$"))
    else
        let l:TabNrs = [tabpagenr()]
    endif
    for s:tn in l:TabNrs
        " move tab
        execute("normal! " . s:tn . "gt")
        let s:sec = str2nr(strftime("%S", localtime()))

        "set command height.
        call s:oepn_close(1)

        call s:run_sl_main()

        "return command height.
        call s:oepn_close(0)
    endfor

endfunction
