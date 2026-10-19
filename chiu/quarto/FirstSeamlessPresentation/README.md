# SeamlessStreaming / EMMA 實作進度

沿用 `../SimulST/` 的米白底、深藍標題、青綠重點、1280 × 720 版面、結論框與中文講者筆記。共 23 頁，包含封面、17 頁主簡報、4 頁附錄與參考資料。

## 修改與預覽

在此資料夾執行：

```sh
quarto preview seamless_streaming_progress.qmd
quarto render seamless_streaming_progress.qmd
```

- `seamless_streaming_progress.qmd`：簡報內容與逐頁講者筆記。
- `_quarto.yml`：Reveal.js 與資源內嵌設定。
- `styles.css`：SimulST 樣式與本簡報的表格、截圖排版。
- `assets/*.svg`：可編輯的五張流程與比較圖。
- `images/`：保留原始實驗截圖。
- `seamless_streaming_progress.html`：產生的簡報，資源已內嵌，可直接離線開啟。

左右方向鍵換頁，`Esc` 看總覽，`F` 全螢幕，`S` 開啟講者模式。附錄保留原始截圖與程式呼叫。渲染後套用 SimulST 共用的 Live Server 講者 HTML 修正。

數據沿用原簡報，未重新執行實驗。CER / WER 的比較對象為 offline 模型輸出；0.54 秒為快速餵入時的程式耗時，1.92 秒為第一次 WRITE 的來源音訊位置。

## Quarto 專案資料夾

新增的獨立簡報集中於 [`quarto/`](quarto/README.md)。

- [SeamlessM4T_ModelArchitecture](quarto/SeamlessM4T_ModelArchitecture/README.md)：UnitY2、T2U／Duration 與 SeamlessExpressive 架構簡報。
