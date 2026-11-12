# Channel ASR 論文導讀

以使用者提供的 QMD 為內容、`theme.scss` 為設計參考的獨立 Quarto Reveal.js 簡報。

直接開啟 [channel-asr-slides.html](channel-asr-slides.html)，或執行：

```sh
cd chiu/quarto/channel-asr
quarto preview channel-asr-slides.qmd
```

重新產生可離線分享的單一 HTML：

```sh
quarto render
```

方向鍵／空白鍵逐步呈現，`S` 開啟講者視圖，`O` 看總覽，`F` 全螢幕，`?` 查看快捷鍵。講者視圖若被瀏覽器阻擋，請允許此簡報的彈出視窗，或使用 `quarto preview`。

- `channel-asr-slides.qmd`：完整研究內容、原數據、講者備註、主投影片後的附錄（含新增的 Fig. 1 原圖）。
- `_quarto.yml`：1280 × 800、fade 換頁、離線資源嵌入與 MathML。
- `theme.scss`：使用者原始 SCSS，完整保留。
- `channel-asr.scss`：淺色封面與章節頁、熱圖、流程與密集頁面的適配。
- `title-slide.html`：以自訂封面取代自動標題頁。
- `fonts.html`、`fonts/`：Figtree、Source Serif 4 可變字體與 OFL 授權；中文字體由裝置系統提供。
- `DESIGN.md`：原主題設計系統、色彩、字體、版面、元件、動畫及 class 分析。
- `figs/`：從論文固定版本 PDF 裁出的原圖與來源說明。

研究主張與數字沿用提供的 QMD；此工作著重版面與可呈現性，沒有將報告者推論改寫成論文結論。原始 QMD 中「待確認」、「我的理解」、「推測」等措辭保留。

論文來源：[Revealing the Role of Audio Channels in ASR Performance Degradation, arXiv:2508.08967v2](https://arxiv.org/abs/2508.08967v2)。

驗證結果：Quarto render 成功；Chrome 以 1440 × 900 檢查全部 27 頁，文字、表格與圖片未超出投影片；三張原圖可正常顯示且已內嵌，兩款指定字體載入成功。原始表格及 11 段講者備註逐一比對一致。

三張原圖各有主簡報導讀頁：Fig. 1 原圖後接數值矩陣，Fig. 2 流程後接設計理由，Fig. 3 獨立放大並標明質性證據限制。圖片以使用者提供 PDF 重新裁切。

Live Server 預覽相容性：`scripts/fix_slide_preview.py` 會在每次 render 後，自動將內嵌講者視窗字串裡的 HTML 結尾標籤改成 JavaScript 等價的跳脫寫法，避免 Live Server 將自動重新整理程式誤插入字串。可直接開啟 HTML、使用 VS Code Live Server，或使用 `quarto preview`。
