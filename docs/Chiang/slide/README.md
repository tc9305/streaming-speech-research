# SimulST／Speech LLM 研究選題討論

會議日期：2026-10-22。18 頁主簡報（含封面及參考文獻），後接 6 頁備用。主報告約 20 分鐘，逐頁建議時間與研究細節在講者備註。第 6 頁使用使用者提供的 A–J 路線圖；原有可編輯事件圖移至備用 B6。

## 播放

開啟 [渲染完成的 HTML](research-discussion-2026-10-22.html)，或在 VS Code 使用 Go Live。請將 HTML 與同資料夾的 `research-discussion-2026-10-22_files/` 保持在一起；其中是本地 Reveal.js 資源。投影片播放不依賴網路，外部文獻連結需要網路。中文字型優先使用 Windows 的 Microsoft JhengHei，並提供 Noto Sans TC、PingFang TC 等 fallback。

- 左右方向鍵／空白鍵：翻頁。
- Home：回封面。Esc：總覽。
- F：全螢幕。S：講者模式（瀏覽器需允許彈出視窗）。
- 第 18 頁之後是 B1–B6 備用頁，不算入主簡報頁數。
- 備註使用 Quarto 原生 `::: notes`，一般播放畫面不顯示。

若直接開本機 HTML 時瀏覽器限制講者視窗，使用以下預覽方式，並允許 localhost 的彈出視窗。

## 預覽與重新渲染

已確認製作環境有 Quarto 1.10.18。本專案不執行 Python／R，也不需要模型或 GPU。

在此資料夾執行：

```powershell
quarto preview research-discussion-2026-10-22.qmd
```

修改後重新產生 HTML：

```powershell
quarto render research-discussion-2026-10-22.qmd
```

## 可編輯檔案

- [QMD 原始稿](research-discussion-2026-10-22.qmd)：全部內容、文字式圖表、表格、案例與講者備註。
- [Quarto 設定](_quarto.yml)：Reveal.js、16:9、資源嵌入與播放設定。
- [樣式](slides.css)：淺色學術風格；借鑑指定 llama-omni 樣式的字體和主色，未修改原檔。
- [導覽輔助](navigation.html)：Home 鍵回封面。
- [路線圖](assets/simulst-research-routes.png)：使用者提供的圖片，放在主簡報第 6 頁。
- [來源清單](sources.md)：正式引用、版本、核對位置與證據邊界。
- [來源快照](sources/)：三份 GitHub 輸入報告，保持原文。

Quarto 使用已安裝版本隨附的 Reveal.js 生成本地資源，無需修改或依賴既有 llama-omni 簡報的函式庫。不要開啟舊的單檔 HTML 快取；修改後重新渲染並重新整理瀏覽器。未發布網站、未推送 GitHub、未修改原始研究報告。

本簡報全部 A–J 為待驗證提案。兩份 R2 不視為本研究實驗結果，沒有預先承諾改善百分比、硬體需求或訓練時數。
