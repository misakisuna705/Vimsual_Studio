" ==================================================================================================================== "

" 插件安裝

" ==================================================================================================================== "

" junegunn/vim-plug

" 自動安裝vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 自動安裝所有插件
au VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

" =========================================================== "

" 插件開始位置
call plug#begin('~/.vim/plugged')

" 瀏覽插件
Plug 'airblade/vim-rooter'
Plug 'skywind3000/vim-quickui'
Plug 'Yggdroot/LeaderF', {'on': 'LeaderfFile', 'do': './install.sh'}
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeVCS', 'NERDTreeClose']}
Plug 'liuchengxu/vista.vim', {'on': ['Vista', 'Vista!']}
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/vim-cppman', {'on': 'Cppman'}
Plug 'easymotion/vim-easymotion', {'on': '<Plug>(easymotion-sn)'}
Plug 'mhinz/vim-signify'

" 編輯插件
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'scrooloose/nerdcommenter', {'on': '<plug>NERDCommenterToggle'}

" 補全插件
Plug 'Valloric/YouCompleteMe', {'for': ['c', 'cpp', 'python', 'vlang'], 'do': './install.py --all'}
Plug 'rdnetto/YCM-Generator', {'on': 'YcmGenerateConfig', 'branch': 'stable'}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['html', 'css', 'scss', 'javascript', 'typescript', 'json', 'yaml', 'cs', 'swift']}
Plug 'mattn/emmet-vim', {'for': 'html'}

" 偵錯插件
Plug 'w0rp/ale', {'on': 'ALELint'}

" 排版插件
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'fisadev/vim-isort', {'on': 'Isort'}
Plug 'mzlogin/vim-markdown-toc', {'on': ['GenTocGFM', 'RemoveToc']}
Plug 'vhda/verilog_systemverilog.vim', {'for': 'vlang'}

" 建構插件
Plug 'iamcco/markdown-preview.vim', {'on': '<Plug>MarkdownPreview'}
Plug 'iamcco/mathjax-support-for-mkdp', {'on': '<Plug>MarkdownPreview'}
Plug 'kassio/neoterm', {'on': ['T', 'Topen', 'Tclose', 'Tclear']}

" 主題插件
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'

" 插件啟用終點
call plug#end()

" ==================================================================================================================== "

" 插件配置

" ==================================================================================================================== "

" airblade/vim-rooter

" 切換根目錄時不顯示訊息
let g:rooter_silent_chdir = 1

" =========================================================== "

" skywind3000/vim-quickui

let share = [
            \ [ 'push to github', 'call Push_Github()' ],
            \ [ 'publish to npm', 'call Publish_Npm()' ],
            \ [ 'deploy to firebase', 'call Deploy_Firebase()' ],
            \ ]

let goto = [
            \ [ 'find definition', 'exec "Leaderf gtags --path-style absolute -d " . expand("<cword>")' ],
            \ [ 'find reference', 'exec "Leaderf gtags --path-style absolute -r " . expand("<cword>")' ],
            \ [ 'find keyword', 'Leaderf rg' ],
            \ ]

" 搜尋標籤
nnoremap <silent> <C-f> :call quickui#context#open(goto, {'index':g:quickui#context#cursor})<CR>
" 預覽標籤
nnoremap <S-m> :call quickui#tools#preview_tag('')<CR>
nnoremap <S-h> :call quickui#preview#scroll(-1)<CR>
nnoremap <S-n> :call quickui#preview#scroll(1)<CR>
" 發布專案
nnoremap <silent> <F12> :call quickui#listbox#open(share, {})<CR>

" =========================================================== "

" Yggdroot/LeaderF

" 使用gtags
let g:Lf_GtagsAutoGenerate = 1
" 使用popup模式
let g:Lf_WindowPosition = 'popup'
" 設定leaderF開檔覆蓋空buffer
let g:Lf_DiscardEmptyBuffer = 1
" 設定LeaderF檔案所在目錄
let g:Lf_CacheDirectory = expand('~/.cache')
" 設定LeaderF搜尋所在專案之根目錄
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RootMarkers = ['.git']
let g:Lf_UseVersionControlTool = 0
" 搜尋隱藏檔案
let g:Lf_ShowHidden = 1
" 搜尋symlink插件
let g:Lf_FollowLinks = 1
" 不搜尋的檔案與路徑
let g:Lf_WildIgnore = {
            \ 'dir': ['.adobe', '.android', '.antigen', '.cache', '.config', '.dotfiles', '.dotnet', '.gradle', '.local', '.mitmproxy', '.mono', '.node-gyp', '.npm', '.nuget', '.omnisharp', '.oracle_jre_usage', '.ssh', '.subversion', '.swt', '.templateengine', '.Trash', '.vim', 'Documents', 'Music', 'Pictures', 'Movies', 'Applications', 'Applications (Parallels)', 'Cache', 'go', 'Google Drive File Stream', 'bin', 'Library', 'node_modules', 'Server', 'temp', '.git', 'build', 'dist'],
            \ 'file': ['.DS_Store', '*.pvm']
            \}

" 隱藏LeaderF的help提醒
let g:Lf_HideHelp = 1
" 顯示模糊搜索文件的絕對路徑
let g:Lf_ShowRelativePath = 0
" 設定主視窗
let g:Lf_PopupHeight = 0.23
let g:Lf_PopupWidth = &columns * 0.8
" 設定預覽視窗
let g:Lf_PreviewInPopup = 1

" 設定LeaderF主題
let g:Lf_StlSeparator = {'left': '', 'right': ''}

let g:Lf_StlPalette = {
            \   'stlName': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '81'
            \   },
            \
            \   'stlCategory': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \
            \   'stlFullPathMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   },
            \
            \   'stlFuzzyMode': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '141'
            \   },
            \
            \   'stlCwd': {
            \       'cterm': 'NONE',
            \       'ctermfg': '166',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlBlank': {
            \       'cterm': 'NONE',
            \       'ctermfg': 'NONE',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlLineInfo': {
            \       'cterm': 'NONE',
            \       'ctermfg': '161',
            \       'ctermbg': '233'
            \   },
            \
            \   'stlTotal': {
            \       'cterm': 'NONE',
            \       'ctermfg': '233',
            \       'ctermbg': '161'
            \   }
            \ }

let g:Lf_PopupPalette = {
            \   'dark': {
            \       'Lf_hl_popup_inputText': {
            \           'cterm': 'NONE',
            \           'ctermfg': 'NONE',
            \           'ctermbg': '0'
            \       },
            \
            \       'Lf_hl_popup_window': {
            \           'cterm': 'NONE',
            \           'ctermfg': '255',
            \           'ctermbg': '0'
            \       },
            \
            \       'Lf_hl_popup_category': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '141'
            \       },
            \
            \       'Lf_hl_popup_inputMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '81'
            \       },
            \
            \       'Lf_hl_popup_fullPathMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '161'
            \           },
            \
            \       'Lf_hl_popup_fuzzyMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '141'
            \       },
            \
            \       'Lf_hl_popup_normalMode': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '81'
            \       },
            \
            \       'Lf_hl_popup_blank': {
            \           'cterm': 'NONE',
            \           'ctermfg': 'NONE',
            \           'ctermbg': '233'
            \       },
            \
            \       'Lf_hl_popup_lineInfo': {
            \           'cterm': 'NONE',
            \           'ctermfg': '161',
            \           'ctermbg': '233'
            \       },
            \
            \       'Lf_hl_popup_total': {
            \           'cterm': 'NONE',
            \           'ctermfg': '233',
            \           'ctermbg': '161'
            \       },
            \
            \       'Lf_hl_popup_cwd': {
            \           'cterm': 'NONE',
            \           'ctermfg': '166',
            \           'ctermbg': '233'
            \       }
            \   }
            \ }

" 搜尋文件
nnoremap <silent> <C-p> :LeaderfFile<CR>
" 其他快捷鍵
let g:Lf_CommandMap = {'<C-]>': ['<C-o>'], '<C-t>': ['<CR>'], '<ESC>': ['<C-p>', '<C-f>'], '<C-p>': ['<C-n>']}

" =========================================================== "

" scrooloose/nerdtree

" 顯示隱藏檔案
let g:NERDTreeShowHidden = 1
" 不顯示的檔案
let NERDTreeIgnore = ['.DS_Store', '^build$']

" 設定nerdtree位置
let g:NERDTreeWinPos = 'right'
" 設定nertree寬度
let g:NERDTreeWinSize = 25
" 不顯示nerdtree的Press ? for help提醒
let NERDTreeMinimalUI = 1
" 開啟檔案後關閉nerdtree
let NERDTreeQuitOnOpen = 1

" 按下control+o鍵時，垂直分屏後開啟舊檔
let g:NERDTreeMapOpenVSplit = '<C-o>'
let g:NERDTreeCustomOpenArgs = {'file': {'where': 't'}}
" 重新映射快速鍵以釋放按鍵
let g:NERDTreeMapOpenSplit = 'xxxi'
let g:NERDTreeMapJumpNextSibling = 'xxxcj'
let g:NERDTreeMapJumpPrevSibling = 'xxxck'

" 按下control+n鍵時，切換nerdtree與vista.vim
nnoremap <silent> <C-n> :call NVtoggle()<CR>

function! NVtoggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
        Vista
    elseif exists("t:vista")
        Vista!
        NERDTreeVCS
    else
        NERDTreeVCS
    endif
endfunction

" =========================================================== "

" liuchengxu/vista.vim

" 設定vista位置
let g:vista_sidebar_position = 'vertical'
" 設定vista寬度
let g:vista_sidebar_width = 25
" vista不顯示訊息
let g:vista_echo_cursor = 0
" 跳轉標籤後關閉vista
let g:vista_close_on_jump = 1

" =========================================================== "

" ludovicchabant/vim-gutentags

" 顯示標籤詳細資料
" let g:gutentags_trace = 1

" 設定標籤搜尋所在專案之根目錄
let g:gutentags_project_root = ['.git']

" 設定標籤存放目錄與副檔名
if !isdirectory(expand('~/.cache/tags'))
    silent! call mkdir(expand('~/.cache/tags'))
endif
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_tagfile = '.tags'

" 設定標籤參數
let g:gutentags_ctags_extra_args = ['--fields=+lniazS', '--extra=+q', '--exclude=build', '--langmap=c:.c.h']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" =========================================================== "

" skywind3000/vim-cppman

" 設定manual開啟位置
let g:cppman_open_mode = "vertical"

" 按下q鍵時，開啟cppman
au FileType cpp nnoremap q :Cppman <C-r><C-w><CR>
au FileType c nnoremap q :Cppman! 3 <C-r><C-w><CR>

" =========================================================== "

" easymotion/vim-easymotion

" 關閉預設映射
let g:EasyMotion_do_mapping = 0

" 關鍵字不分大小寫
let g:EasyMotion_smartcase = 1

" 啟動搜尋功能
nmap s <Plug>(easymotion-sn)

" =========================================================== "

" mhinz/vim-signify

" 按下shift+f鍵時，跳轉signify
nnoremap <silent> <expr> <plug>(sy-hunk-next) &diff
            \ ? ']c'
            \ : ":\<c-u>call <sid>signify_hunk_next(v:count1)\<cr>"
nmap <S-f> <plug>(sy-hunk-next)

function! s:signify_hunk_next(count) abort
    let oldpos = getcurpos()
    call sy#jump#next_hunk(a:count)
    if getcurpos() == oldpos
        call sy#jump#prev_hunk(9999)
    endif
endfunction

" ==================================================================================================================== "

" mg979/vim-visual-multi

" 游標復位
let g:VM_reselect_first = 1

" 關閉預設訊息
let g:VM_set_statusline = 0
let g:VM_silent_exit = 1

" 關閉預設映射
let g:VM_default_mappings = 0
let g:VM_maps = {}

" 全選多光標關鍵字
let g:VM_maps['Visual All']  = '<S-a>'
let g:VM_maps['Find Under']  = ''
let g:VM_maps['Find Subword Under']  = ''
" 離開多光標模式
fun! VM_Start()
    nmap <buffer> <C-C> <Esc>
    imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
    nunmap <buffer> <C-C>
    iunmap <buffer> <C-C>
endfun
" 按下a鍵時，開始多光標編輯
let g:VM_maps['c'] = 'a'

" =========================================================== "

" scrooloose/nerdcommenter

" 按下/+/鍵增刪註解
nmap <silent> // <plug>NERDCommenterToggle
vmap <silent> // <plug>NERDCommenterToggle

" ==================================================================================================================== "

" Valloric/YouCompleteMe

" 禁用clangd
let g:ycm_use_clangd = 0

" 設定.ycm_extra_conf.py預設位置
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 自動偵測.ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0

" 輸入兩個字元時，開始匹配標籤補全視窗
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
" 輸入兩個字元時，開始匹配語法/語意補全視窗
let g:ycm_semantic_triggers = {
            \ 'c,cpp,python': ['re!\w{2}'],
            \ }

" 不顯示補全定義
set completeopt-=preview
" 不用YCM進行實時語法偵錯(使用ale)
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
let g:ycm_key_list_stop_completion = ['<CR>']

" 按下begin+enter鍵時，自動換行縮進補全end
au FileType vlang inoremap begin<CR> begin<CR>end<ESC><UP>$<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
" 按下(+enter鍵時，自動換行縮進補全)
au FileType vlang inoremap (<CR> (<CR>);<ESC><UP>o

" =========================================================== "

" neoclide/coc.nvim

" 安裝coc插件
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-omnisharp', 'coc-sourcekit']

" 按下tab鍵或shift+tab鍵時，上下瀏覽補全視窗
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 按下enter鍵時，自動選中當前選項，並關閉補全視窗
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" =========================================================== "

" mattn/emmet-vim

" 按下Control+z+,鍵時，自動補全標籤
let g:user_emmet_leader_key = '<C-z>'

" ==================================================================================================================== "

" w0rp/ale

" 不進行實時偵錯，保存時才偵錯
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 0
au FileType c,cpp,python,html,css,scss,javascript,typescript,verilog_systemverilog,sh
            \ au! BufWrite <buffer> ALELint

" 設定linter參數
let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_python_flake8_options = '--ignore=E501,E302,E225,E226,E251,E201,E305,E711,E117,E101,F403,F405,W191,W291,W293'

" 設定linter
let g:ale_linters = {
            \   'c': ['clang', 'cppcheck'],
            \   'cpp': ['clang', 'cppcheck'],
            \   'python': ['flake8'],
            \   'html': ['htmlhint'],
            \   'css': ['stylelint'],
            \   'scss': ['stylelint'],
            \   'javascript': ['tsserver'],
            \   'typescript': ['tsserver'],
            \   'verilog_systemverilog': ['iverilog'],
            \   'sh': ['shellcheck']
            \}

" 設定ale偵錯顯示格式
let g:ale_echo_msg_format = '[%linter%] %code: %%s'

" 設定符號
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 符號背景使用iterm
hi clear ALEErrorSign
hi clear ALEWarningSign
" 標示背景使用底線
au VimEnter * hi ALEWarning cterm=underline
au VimEnter * hi ALEError cterm=underline

" 按下f鍵時，跳轉偵錯訊息
nmap f <Plug>(ale_next_wrap)

" ==================================================================================================================== "

" Chiel92/vim-autoformat

" 顯示格式化詳細資料
" let g:autoformat_verbosemode=1

" 按下空白鍵+e時，自動排版
nnoremap <silent> <SPACE>e :Autoformat

" 載入astyle的google風格排版c/cpp/cs檔案
let g:formatdef_misakisuna_astyle = '"astyle --style=google --indent-switches --indent-namespaces -p"'
let g:formatters_c = ['misakisuna_astyle']
let g:formatters_cpp = ['misakisuna_astyle']
let g:formatters_cs = ['misakisuna_astyle']
" 載入cmake_format排版cmake檔案
let g:formatters_cmake = ['cmake_format']

" 載入yapf的google風格排版py檔案
let g:formatdef_misakisuna_yapf = '"yapf --style=''{based_on_style: google, column_limit: 150}''"'
let g:formatters_python = ['misakisuna_yapf']

" 載入prettier排版web/md檔案
let g:formatters_html = ['prettier']
let g:formatters_css = ['prettier']
let g:formatters_scss = ['prettier']
let g:formatters_javascript = ['prettier']
let g:formatters_typescript = ['prettier']
let g:formatters_json = ['prettier']
let g:formatters_markdown = ['prettier']

" 載入asm_format排版asm檔案
let g:formatdef_asm_format = '"asmfmt"'
let g:formatters_asm = ['asm_format']

" 載入shfmt排版sh檔案
let g:formatters_sh = ['shfmt']

" 在web檔案中，按下tab鍵時，電腦顯示為2個空格(不一定辨認為space語法)
au FileType html,css,scss,javascript,json,yaml set softtabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,scss,javascript,json,yaml set tabstop=2
" 在web檔案中，使用tab語法時，電腦顯示為2個空格
au FileType html,css,scss,javascript,json,yaml set shiftwidth=2

" =========================================================== "

" fisadev/vim-isort

" 檔案保存時，自動排版
au BufWrite *.py :Isort

" =========================================================== "

" mzlogin/vim-markdown-toc

" 生成github格式目錄
let g:vmt_fence_hidden_markdown_style = 'GFM'
" 優化目錄語法
let g:vmt_cycle_list_item_markers = 1

" 按下F3鍵時，生成目錄
au FileType markdown nnoremap <F3> :GenTocGFM<CR>
" 按下F4鍵時，刪去目錄
au FileType markdown nnoremap <F4> :RemoveToc<CR>

" ==================================================================================================================== "

" iamcco/markdown-preview.vim

" 推播檔案
au FileType markdown nmap <F1> <Plug>MarkdownPreview
" 關閉推播
au FileType markdown nmap <F2> <Plug>StopMarkdownPreview

" =========================================================== "

" kassio/neoterm

" 設定neoterm位置
let g:neoterm_default_mod = 'botright'

" 設定neoterm高度
let g:neoterm_size = 8

" 標記終端機的空白鍵和換行符
hi NonText ctermfg=242 ctermbg=NONE
au TerminalOpen * set list listchars=space:_

" 建構c/cpp專案發行版
au FileType c,cpp nnoremap <silent> <F1> :Tclear<CR>:T cmake . -GNinja -DCMAKE_BUILD_TYPE=Release -Bbuild/release && ninja -C ./build/release<CR>
" 執行c/cpp專案
au FileType c,cpp nnoremap <silent> <F2> :Tclear<CR>:T [ "$(ls data/)" ] && bin/main < data/*.* \|\| bin/main<CR>
" 建構c/cpp專案測試版
au FileType c,cpp nnoremap <silent> <F3> :Tclear<CR>:T cmake . -GNinja -DCMAKE_BUILD_TYPE=Debug -Bbuild/test && ninja -C ./build/test<CR>

" 按下F1鍵時，直譯該行
au FileType python nnoremap <silent> <F1> :Tclear<CR>:TREPLSendLine<CR>
" 按下F2鍵時，直譯多行
au FileType python vnoremap <silent> <F2> :Tclear<CR>:TREPLSendSelection<CR>
" 按下F3鍵時，直譯python文件
au FileType python nnoremap <silent> <F3> :Tclear<CR>:TREPLSendFile<CR>

" 按下F1鍵時，推播webpage專案
au FileType html nnoremap <silent> <F1> :call Run_Web()<CR>
" 按下F2鍵時，停止推播webpage專案
au FileType html nnoremap <silent> <F2> :Tkill<CR>

" 按下F1鍵時，編譯執行csharp專案
au FileType cs nnoremap <silent> <F1> :call Run_Csharp()<CR>

" 建構verilog專案發行版
au FileType vlang nnoremap <silent> <F1> :Tclear<CR>:T iverilog -o main main.v<CR>
" 執行verilog專案
au FileType vlang nnoremap <silent> <F2> :Tclear<CR>:T vvp main<CR>
" 調試verilog專案
au FileType vlang nnoremap <silent> <F3> :Tclear<CR>:T open -a gtkwave main.vcd<CR>

" 按下空白鍵+q+enter鍵時，關閉終端機
tnoremap <silent> <SPACE>q exit

function! Run_Web()
    Tclear
    T gulp
endfunction

function! Run_Csharp()
    "let save_view = winsaveview()
    Tclear
    T dotnet run
    "call winrestview(save_view)
endfunction

function! Push_Github()
    Tclear
    T git add . && git commit -m "commit" && git push
endfunction

function! Publish_Npm()
    Tclear
    T npm publish
endfunction

function! Deploy_Firebase()
    Tclear
    firebase deploy
endfunction

" =========================================================== "

" vim/termdebug

" 版面配置
let g:termdebug_wide = 1

" termdebug去背
au TerminalOpen * hi debugBreakpoint cterm=bold ctermbg=None
au TerminalOpen * hi debugPC ctermbg=242

" 按下shift+k鍵時，游標移到下一段
au BufLeave * nnoremap <S-k> }

" 按下F4鍵時，測試c / cpp專案
au FileType c,cpp nnoremap <silent> <F4> :call Run_Cpp_Debugger()<CR>
" 按下F5鍵時，設置斷點
au FileType c,cpp nnoremap <silent> <F5> :Break<CR>
" 按下F6鍵時，清除斷點
au FileType c,cpp nnoremap <silent> <F6> :Clear<CR>
" 按下F7鍵時，執行調試
au FileType c,cpp nnoremap <silent> <F7> :Run<CR>
" 按下F8鍵時，繼續調試
au FileType c,cpp nnoremap <silent> <F8> :Continue<CR>
" 按下F9鍵時，單步繼續
au FileType c,cpp nnoremap <silent> <F9> :Over<CR>
" 按下F10鍵時，單步進入
au FileType c,cpp nnoremap <silent> <F10> :Step<CR>

function! Run_Cpp_Debugger()
    cd %:p:h
    packadd termdebug
    wincmd j
    q
    Termdebug test/%:t:r
    wincmd h
    aunmenu WinBar
endfunction

" ==================================================================================================================== "

" sheerun/vim-polyglot

" 語法禁用
let g:polyglot_disabled = ['markdown']

" =========================================================== "

" itchyny/lightline.vim

" 顯示tab列
set showtabline=2
" 設定狀態列高度
set laststatus=2

" 關閉多餘模式提醒
set noshowmode

" 啟用lightline的monokai主題
let g:lightline = {
            \   'colorscheme': 'molokai',
            \}
let g:lightline.separator = {
            \   'left': '', 'right': ''
            \}
let g:lightline.subseparator = {
            \   'left': '', 'right': ''
            \}

" 按下n鍵時，跳轉到上一個tab
nnoremap <silent> n :tabN<CR>
" 按下m鍵時，跳轉到下一個tab
nnoremap <silent> m :tabn<CR>

" 按下空白鍵+q+enter鍵時，關閉tab或vim
nnoremap <silent> <SPACE>q :call Bye()

function! Bye()
    if tabpagenr('$') > 1
        cclose
        Tclose
    endif
    q
endfunction

" =========================================================== "

" ErichDonGubler/vim-sublime-monokai

" 啟用monokai主題
colorscheme sublimemonokai

" ==================================================================================================================== "

" 環境配置

" 不產生暫存檔
set noswapfile
" 切換buffer不關閉文件
set hidden
" 簡化狀態列訊息
set shortmess+=c
" 游標刷新時間
set updatetime=300

" 共用系統剪貼板
set clipboard=unnamed
" 設置命令鍵反應時間
set ttimeout ttimeoutlen=100
" 垂直分屏靠右
set splitright
" 主畫面關閉時，自動關閉剩餘窗口
au BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" 使delete(backspace)鍵能正常使用
set backspace=2
" 使光標限制於頂部底部3行
set scrolloff=3
" 使游標能跨行使用
set whichwrap=b,s,<,>,[,]
" 使滑鼠能正常使用
set mouse=a

" 設定行數
set textwidth=150
" 自動對齊縮排
set autoindent
" 按下tab鍵或自動對齊縮排時，電腦辨認為space語法
set expandtab
" 按下tab鍵時，電腦顯示為4個空格(不一定辨認為space語法)
set softtabstop=4
" 使用tab語法時，電腦顯示為4個空格
set tabstop=4
" 自動對齊縮排時，電腦顯示為4個空格(不一定辨認為space語法)
set shiftwidth=4

" 在makefile檔案中，按下tab鍵時，電腦辨認為tab語法
au FileType make set noexpandtab

" =========================================================== "

" 主題配置

" vim背景使用iterm
hi Normal ctermbg=NONE

" popmenu背景使用灰色
hi PMenu ctermfg=255 ctermbg=237
hi PMenuSbar ctermfg=NONE ctermbg=237
hi PmenuThumb ctermfg=NONE ctermbg=237

" 自動顯示sign欄位
set signcolumn=yes
" sign欄位去背
hi signcolumn ctermbg=None
hi SignifySignAdd    cterm=bold ctermbg=None ctermfg=119
hi SignifySignDelete cterm=bold ctermbg=None ctermfg=167
hi SignifySignChange cterm=bold ctermbg=None ctermfg=227

" 自動顯示行號
set number
" 行號去背
hi LineNr ctermbg=NONE
" 游標所在行號粗體顯示
hi CursorLineNr cterm=bold

" 高亮所在行位
set cursorline
" 高亮所在欄位
set cursorcolumn

" =========================================================== "

" 映射配置

" 按下a鍵時，自動進入插入模式
nnoremap <silent> a <INSERT>
" 按下;鍵時，自動進入插入模式並遞進一格
nnoremap <silent> ; a
" 按下k+j鍵時，自動離開插入模式
inoremap <silent> kj <ESC>
tnoremap <silent> kj <C-\><C-n>
" 按下空白鍵+w時，保存檔案
nnoremap <SPACE>w :w

" 按下j鍵時，游標左移
nnoremap j <LEFT>
vnoremap j <LEFT>
" 按下l鍵時，游標右移
nnoremap l <RIGHT>
vnoremap l <RIGHT>
" 按下i鍵時，游標上移
nnoremap i g<UP>
vnoremap i <UP>
" 按下k鍵時，游標下移
nnoremap k g<DOWN>
vnoremap k <DOWN>
" 按下shift+j鍵時，游標高速前移
nnoremap <S-j> B
vnoremap <S-j> B
" 按下shift+l鍵時，游標高速後移
nnoremap <S-l> W
vnoremap <S-l> W
" 按下shift+i鍵時，游標移到上一段
nnoremap <S-i> {
vnoremap <S-i> {
" 按下shift+k鍵時，游標移到下一段
nnoremap <S-k> }
vnoremap <S-k> }

" 按下control+j鍵時，向左切換視窗
nnoremap <C-j> <C-w><C-h>
tnoremap <C-j> <C-w><C-h>
" 按下control+l鍵時，向右切換視窗
nnoremap <C-l> <C-w><C-l>
tnoremap <C-l> <C-w><C-l>
" 按下control+i鍵時，向上切換視窗
nnoremap <C-i> <C-w><C-k>
tnoremap <C-i> <C-w><C-k>
" 按下control+k鍵時，向下切換視窗
nnoremap <C-k> <C-w><C-j>
tnoremap <C-k> <C-w><C-j>

" 按下{+enter鍵時，自動換行縮進補全}
inoremap {<CR> {<CR>}<ESC><UP>$<LEFT><LEFT>
" 按下enter鍵時，在普通模式新增空白行
nnoremap <CR> o<ESC>
" 按下shift+u鍵時，重做上一個動作
nnoremap <S-u> <C-r>

" ==================================================================================================================== "
