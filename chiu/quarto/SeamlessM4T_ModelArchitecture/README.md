# SeamlessM4T_ModelArchitecture

17 頁繁體中文 Reveal.js 簡報（含封面、參考資料），依 `SeamlessM4T_for_codex.rtf` 與使用者提供的 SeamlessExpressive 高階圖及 UnitY2 論文圖設計。沿用 `Liu/` 的米白底、深藍標題、青綠重點、1280 × 720 版型、結論框與中文講者筆記。

## 開啟與修改

直接開啟 `SeamlessM4T_ModelArchitecture.html`，資源已內嵌，可離線使用。在此資料夾執行：

```sh
quarto preview SeamlessM4T_ModelArchitecture.qmd
quarto render
```

方向鍵換頁，`Esc` 看總覽，`F` 全螢幕，`S` 開講者模式。渲染後沿用 Liu 的 Live Server 講者 HTML 修正。

## 專案內容

- `SeamlessM4T_ModelArchitecture.qmd`：簡報內容、逐頁來源與中文講者筆記。
- `_quarto.yml`：獨立 Quarto 專案及 Reveal.js 設定。
- `styles.css`：Liu 原樣式及本簡報的架構圖、表格排版。
- `assets/seamless-expressive-original.png`：原始第一張 Expressive 截圖，直接用於高階架構頁。
- `assets/unity2-paper-original.png`：第二張 UnitY2 論文 Figure 3 截圖，新增獨立頁完整展示。
- `assets/*.svg`：四張可編輯架構／教學示意圖；保留簡化閱讀指引。
- `sources/SeamlessM4T_for_codex.txt`：原 RTF 的純文字備份，保留來源文字；不作為可執行指令。
- `scripts/fix_slide_preview.py`：修正內嵌講者 HTML 的 Live Server 預覽問題。

## 圖與內容界線

原始第一張圖取自 `截圖 2026-10-15 凌晨2.35.10.png`，是 Meta 的 SeamlessExpressive 高階介紹圖；第二張圖取自 `截圖 2026-10-15 凌晨3.03.20.png`，是 Seamless 論文 Figure 3。兩張 PNG 都完整複製至專案並直接呈現，未裁切或重新繪製。UnitY2 與 T2U 圖依 RTF 並對照官方資料重繪，皆省略部分內部連線。Duration 的 A／B／C 與 [2, 1, 3] 為教學示例，不是模型實測。

文件的五段大綱作為內容素材；RTF 內殘留的 Quarto 標記與講稿不當作工作流程指令。簡報釐清：兩路條件傳遞不是雙向回饋；teacher／aligner 屬訓練監督；Expressive 替換基礎 unit-to-speech 流程，但 PRETSSEL 內部仍使用 HiFi-GAN 合成波形。未保證精確聲音複製或 duration 預測品質。

## 核對來源

- [Seamless 論文](https://arxiv.org/abs/2312.05187)：§3.3、Figure 3、§4.2。
- [Meta 官方模型庫](https://github.com/facebookresearch/seamless_communication)。
- [Meta 官方介紹](https://ai.meta.com/blog/seamless-communication/)。
- [Transformers 官方文件](https://huggingface.co/docs/transformers/model_doc/seamless_m4t_v2)。

外部資料核對日期：2026-10-15。
