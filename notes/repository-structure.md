# Repo 架構與重複內容檢查

初次檢查日期：2026-10-09；Chiang 目錄於 2026-10-15 再整理。此檔是維護紀錄，不是新增的研究報告。

## 2026-10-15 Chiang 整理更新

Chiang 的網頁、Quarto 簡報及研究紀錄已集中在 `Chiang/SpeechLLM/`。`docs/Chiang/SpeechLLM/` 中與原稿目錄位元組相同的簡報、CSS、PNG 與 Reveal.js 資源已移除；唯一的網頁報告搬到 `Chiang/SpeechLLM/index.html`。舊根目錄 `SpeechLLM/` 的導引 README 也已移除。下方 2026-10-09 的盤點與搬移紀錄保留作歷史參考。

2026-10-15 另新增 GitHub Actions 發布流程：部署時暫時合併 `docs/` 與 `Chiang/SpeechLLM/`，產物不提交到 Git。Pages 的 Source 須設為 GitHub Actions；原始網頁與簡報仍只在 Chiang 維護一份。

## 現有架構的問題

原本同一層同時使用主題（SimulST、StreamST、SpeechLLM）和人名（Liu、chiu），但首頁只有主題，無法直接找到兩位隊友的報告。Liu 與 Chiu 的 HTML 在 `/docs` 之外，以 README 所述的 GitHub Pages `/docs` 發布方式不會被發布。

保留共同主題，把個人延伸放在研究者資料夾，網站首頁提供三位研究者的報告入口。尚未查驗遠端 GitHub Pages 設定；以上依據 repo 既有發布說明。

## 原稿與網站的對照

| 維護位置 | 網站位置 | 更新方式 |
| --- | --- | --- |
| `SimulST/index.qmd`、CSS、assets | `docs/SimulST/` | 在 SimulST 執行 `quarto render`；已有 output-dir 與 post-render |
| `notes/terminology.md` | `docs/notes/terminology.html` | `python scripts/build_terminology.py`，使用 Quarto Pandoc |
| `Chiang/SpeechLLM/llama-omni/2026-10-08-progress.md`、`results.json` | `docs/Chiang/SpeechLLM/index.html` | 目前是手寫網頁；修改時人工同步，沒有自動產生腳本 |
| `Liu/report.qmd`、data、assets | `Liu/report.html` → `docs/Liu/report.html` | 先依 Liu README 渲染，再執行 `scripts/sync_reports.ps1` |
| `chiu/seamless_streaming_progress.qmd`、assets、images | `chiu/seamless_streaming_progress.html` → `docs/chiu/seamless_streaming_progress.html` | 先依 chiu README 渲染，再執行同步腳本 |
| `StreamST/README.md` | `docs/StreamST/index.html` | 主題說明與手寫入口，各自維護；完整術語集中到共用筆記 |
| 無對應 Markdown | `docs/index.html`、`docs/styles.css` | 手寫網站入口與共用樣式 |

`notes/` 表示共用研究筆記的原稿；`docs/` 表示網站的發布位置，因此 `docs/notes/` 是筆記的網站版，並非第二份獨立研究。`docs/` 中也有手寫頁面，不能把整個資料夾當成可刪除、可完整重新產生的 build 目錄。

## 重複檢查結果與處理

對 Git 追蹤檔案做 SHA-256 比對（排除第三方 libs），並檢查 Markdown、Quarto 設定、HTML 與產生腳本的關係：

| 項目 | 判定 | 處理 |
| --- | --- | --- |
| `SimulST/assets/` 與 `docs/SimulST/assets/` 的 8 個 SVG | 逐檔位元組完全相同；來源與發布副本 | 保留，交由 Quarto 發布；不能把來源圖解刪掉 |
| `SimulST/index.qmd` 與 `docs/SimulST/index.html` | 簡報原稿與產生結果，不是兩份 HTML | 保留；只在原稿編輯研究內容 |
| `notes/terminology.md` 與 `docs/notes/terminology.html` | 以 Quarto 隨附 Pandoc 重新轉換並套用腳本的表格包裝後，正文完全一致（忽略換行格式與正文前後空白） | 保留原稿和網頁版；由腳本同步 |
| SpeechLLM 的進度 Markdown、JSON 與 HTML | 同一輪研究的閱讀版與結構化紀錄，格式及呈現有差異；不是位元組重複檔案 | 移入 Chiang，保留所有研究資料及網頁圖解 |
| `StreamST/README.md`、`Liu/README.md`、StreamST 網頁及術語筆記 | 部分背景、連結及研究方向重述；Liu 另有 Nemotron 使用說明，StreamST 網頁是摘要入口 | 保留，避免刪掉獨有資訊；修正 Liu 指令中過時的 StreamST 工作目錄 |
| `Liu/README copy.md` | 短版導引，連回 README；不是完整副本 | 保留，不依檔名直接刪除 |
| 原有 HTML 頁面之間 | 沒有找到位元組完全相同的完整 HTML；共用樣式和主題重述不等於同一頁 | 不合併不同研究報告 |
| Liu、Chiu 新增的 `/docs` HTML | 明確的發布副本，應與各自本機 HTML 完全相同 | 只透過同步腳本更新，讓老師從首頁找到報告 |

第三方 `chiu/libs/` 是簡報使用的函式庫，不當作研究重複內容處理。本次沒有以所有互動狀態的瀏覽器畫面作逐頁像素比對；上述「相同」限於雜湊與原稿／產物關係可確認的範圍。

整理後已檢查 24 個 HTML 內部連結／資源路徑，全部存在且位於 `docs/` 內；排除內嵌 script/style 中的程式字串。Liu、Chiu 發布副本與原始 HTML 的 SHA-256 相同。SpeechLLM 搬移前後比對確認：JSON、架構圖保留，Markdown 與 HTML 除上述路徑／負責人標示調整外內容不變。`git diff --check` 通過。

## 本次整理範圍

- `SpeechLLM/` 研究資料搬到 `Chiang/SpeechLLM/`，只調整負責人標示與相對連結。
- 網頁與架構圖搬到 `docs/Chiang/SpeechLLM/`；舊 `docs/SpeechLLM/index.html` 改為轉址，避免維護兩份報告。
- 舊根目錄 `SpeechLLM/README.md` 保留導引；GitHub 舊的細部檔案網址不支援此 HTML 轉址，需要改用新路徑，歷史仍可從 Git 查閱。
- 新增 Chiang README、三人首頁入口與簡報同步腳本；Liu、Chiu 簡報內容和原稿不修改。
- 維持 `Liu`、`chiu` 的既有大小寫，不大量改名，以避免 GitHub Pages 大小寫敏感的網址失效。

## 後續維護原則

個人研究放在各自資料夾；跨研究者共用的術語只在 `notes/` 維護；共同論文簡報維持在 `SimulST/`。新報告由首頁連入，發布檔案必須位於 `docs/` 內，不能從發布頁面用 `../..` 連到 repo 根目錄的私人研究檔案。

目前 SpeechLLM Markdown 與手寫 HTML 仍有雙份維護成本。本次保留原有呈現，未直接用自動轉換覆蓋報告。未來若改為 Quarto 或模板產生，應先確保架構圖、表格與原樣實驗輸出均能保留。
