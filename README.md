# macOS / ubuntu

<!-- vim-markdown-toc GFM -->

+ [快速安裝](#快速安裝)
    * [macOS / Ubuntu](#macos--ubuntu)
    * [docker](#docker)
+ [手動配置](#手動配置)
    * [終端環境](#終端環境)
    * [依賴環境](#依賴環境)
    * [編程環境](#編程環境)

<!-- vim-markdown-toc -->

---

# 快速安裝

## macOS / Ubuntu

```zsh
git clone https://github.com/misakisuna705/Vimsual_Studio.git ~/.dotfiles

~/.dotfiles/setup.sh
```

## docker

```zsh
docker pull misakisuna705/vimsual-studio
```

# 手動配置

## 終端環境

-   [詳情按此](doc/md/terminal.md)

|   OS   | macOS  |  Ubuntu（VM）  |  Ubuntu（WSL）   |
| :----: | :----: | :------------: | :--------------: |
| 終端機 | iterm2 | xfce4 terminal | windows terminal |

## 依賴環境

-   [詳情按此](doc/md/package.md)

|    package     |   system   | python | node | go  |   vim    | coc.nvim |
| :------------: | :--------: | :----: | :--: | :-: | :------: | :------: |
| macOS / Ubuntu | brew / apt |  pip   | yarn | go  | vim-plug |   coc    |

## 編程環境

-   [詳情按此](doc/md/vim.md)

| vim  |          按鍵           |                    功能                    |
| :--: | :---------------------: | :----------------------------------------: |
| 模式 |           `a`           | 命令模式 / 終端模式 -> 插入模式 (游標不動) |
|      |           `;`           | 命令模式 / 終端模式 -> 插入模式 (游標遞進) |
|      |         `k`+`j`         | 插入模式 -> 命令模式 / 終端模式 (游標退格) |
| 視窗 |   `SPACE`+`q`+`ENTER`   |            關閉 vim/tab/window             |
|      |         `n`/`m`         |              移至左/右標籤頁               |
|      | `CTRL`+`i`/`k`/`j`/`l`  |         游標移至上/下/左/右方視窗          |
| 游標 |     `i`/`k`/`j`/`l`     |             游標上/下/左/右移              |
|      | `SHIFT`+`i`/`k`/`j`/`l` |           游標高速上/下/左/右移            |
| 瀏覽 |       `CTRL`+`n`        |             切換檔案總管與標籤             |
|      |       `CTRL`+`p`        |                搜尋文件開關                |
|      |       `CTRL`+`f`        |                搜尋標籤開關                |
|      |       `CTRL`+`o`        |             在垂直分屏開啟檔案             |
|      |       `SHIFT`+`m`       |              循環預覽函數定義              |
|      |       `SHIFT`+`n`       |              向下滾動預覽視窗              |
|      |       `SHIFT`+`h`       |              向上滾動預覽視窗              |
|      |           `q`           |             在垂直分屏開啟 man             |
|      |       `SHIFT`+`q`       |           在垂直分屏開啟 cppman            |
|      |           `f`           |                跳轉偵錯訊息                |
|      |       `shift`+`f`       |                跳轉版本訊息                |
|      |           `s`           |               啟動關鍵字引擎               |
| 編輯 |       `SHIFT`+`a`       |               啟動多光標引擎               |
|      |           `a`           |               插入多光標文字               |
|      |         `ENTER`         |                  插入空行                  |
|      |       `{`+`ENTER`       |                  補全括弧                  |
|      |         `/`+`/`         |                    註解                    |
|      |           `u`           |                    復原                    |
|      |       `SHIFT`+`u`       |                    重做                    |
|      |   `SPACE`+`e`+`ENTER`   |                    排版                    |

|      按鍵      |    cpp     |  python  | ios |      web       |  csharp  | markdown | verilog |
| :------------: | :--------: | :------: | :-: | :------------: | :------: | :------: | :-----: |
|      `F1`      | 編譯發行版 | 單行直譯 |     |    開始推播    | 編譯執行 | 開始推播 |  編譯   |
|      `F2`      | 編譯開發版 | 多行直譯 |     |    停止推播    |          | 停止推播 |  執行   |
|      `F3`      |    執行    | 文件直譯 |     |                |          | 生成目錄 |  推播   |
|      `F4`      |    除錯    |          |     |                |          | 刪去目錄 |         |
|      `F5`      |  設置斷點  |          |     |                |          |          |         |
|      `F6`      |  清除斷點  |          |     |                |          |          |         |
|      `F7`      |  執行調試  |          |     |                |          |          |         |
|      `F8`      |  繼續調試  |          |     |                |          |          |         |
|      `F9`      |  單步繼續  |          |     |                |          |          |         |
|     `F10`      |  單步進入  |          |     |                |          |          |         |
|     `F12`      |    發佈    |   發佈   |     |      發佈      |   發佈   |   發佈   |  發佈   |
| `CTRL`+`z`+`,` |            |          |     | 補全 html 標籤 |          |          |         |
