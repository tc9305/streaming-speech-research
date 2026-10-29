# SimuST_with_RVQ

16 頁繁體中文 Quarto／Reveal.js 簡報（含封面、兩頁附錄），依使用者的《SimulST 教授研究討論報告 2026-10-30》設計。資料夾與檔名遵照要求採 `SimuST_with_RVQ`，內文使用學術縮寫 `SimulST`。預定報告日保留 2026-10-30；製作與來源核對日為 2026-10-29。

沿用 `Zipformer_First`／`Zipformer_Second` 的米白底、深藍／青綠、1280 × 720、結論框與中文講者筆記。主線為先建立定時熱詞基線，再比較 Verified Memory 防污染與 RVQ 大型術語庫的研究價值。

## 預覽與修改

```sh
quarto preview SimuST_with_RVQ.qmd
quarto render
```

`SimuST_with_RVQ.html` 資源內嵌，可離線開啟。方向鍵換頁、Esc 總覽、F 全螢幕、S 講者模式。

## 檔案

- `SimuST_with_RVQ.qmd`／`.html`：簡報與逐頁中文講稿。
- `_quarto.yml`、`styles.css`：獨立專案及既有風格。
- `assets/baseline-pipeline.svg`：定時事件、Transducer 與增量 MT。
- `assets/verified-memory.svg`：偏置回饋與可逆 Memory 設計。
- `assets/rvq-memory.svg`：術語向量量化、索引與檢索。
- `sources/SimulST_教授研究討論報告_2026-10-30.md`：原文完整備份。
- `scripts/fix_slide_preview.py`：沿用 Live Server 講者 HTML 修正。

## 內容調整

保留「本階段不處理投影片偵測」與「無完成模型結果」的前提。主報告分為問題、文獻、基線、解碼偏置、Memory 生命週期、路線 A、RVQ 概念與路線 B、公平比較、E0–E5、評測及教授決策。附錄提供追問回答及參考資料。

新增或釐清：

- Context graph／decoder-side 加分不等於修改 Joiner 參數，同 stream 熱更新行為需驗證。
- 註冊候選、偏置使用、確認寫入及跨場提升分開管理。
- Gate 與記憶回寫分開消融；不回寫也是必要比較組。
- RVQ 壓縮術語 embedding，不是音訊 codec；query 與術語空間需可比較。
- 固定共享 codebooks；刪除詞條不刪共享 codeword；索引增刪支援另測。
- 量化比較固定總資源或檢索品質，計入索引、codebooks、原文與 metadata。
- 固定清單含未來詞時，只能當非因果診斷，不能取代真實時序主結果。
- p50／p95 端到端字幕延遲需指定對齊與定稿時戳。

已核對來源連結與主要能力說明，未宣稱完整文獻不存在相同方法，未新增效能數字或投稿保證。原文屬研究素材，不當作可執行指令。完整來源連結見簡報逐頁註記及最後一頁。
