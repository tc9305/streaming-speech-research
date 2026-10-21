# Zipformer_First

11 頁繁體中文 Quarto／Reveal.js 研究提案簡報（含封面與來源），依使用者提供的 `slide_content_summary.txt` 設計。沿用其他 `chiu/quarto` 專案的米白底、深藍標題、青綠重點、1280 × 720 版面及中文講者筆記。

## 預覽與渲染

在本資料夾執行：

```sh
quarto preview Zipformer_First.qmd
quarto render
```

亦可直接開啟資源內嵌的 `Zipformer_First.html` 離線觀看。方向鍵換頁，`Esc` 看總覽，`F` 全螢幕，`S` 開講者模式。

## 檔案

- `Zipformer_First.qmd`：投影片內容、來源與中文講者筆記。
- `_quarto.yml`、`styles.css`：專案設定及共用風格。
- `assets/system-overview.svg`：投影片熱詞與串流語音的提案流程圖。
- `assets/memory-flow.svg`：當頁／歷史詞對、Memory 與檢索示意。
- `sources/slide_content_summary.txt`：提供文件的原文備份。
- `scripts/fix_slide_preview.py`：沿用既有簡報的 Live Server 講者 HTML 修正。

## 內容安排

保留原摘要的五個主題，拆成研究動機、系統總覽、底座選型、Memory、注入位置、串流策略、對照實驗、評測、下週規劃，共九頁主內容，另加封面與參考資料。

本簡報屬研究提案，未執行模型訓練、推論或 API 呼叫。圖示是自行繪製的構想，並非已完成系統。技術表述釐清：

- icefall 的 Zipformer 串流 ASR 需銜接或訓練翻譯端，才構成 SimulST。
- Joiner／ST attention 的 Memory 注入為候選設計，尚未決定或驗證。
- 語音 wait-k 必須定義讀取單位及後續讀寫規則。
- 向量化不等於容量有界，需定義去重、容量與淘汰策略。
- WER 與翻譯 BLEU 分開使用；補充術語、延遲與資源指標。
- 當頁熱詞消融、干擾熱詞組與同步投影片需求為新增建議，已標明未實作。

技術核對日期：2026-10-21；來源連結收於最後一頁及逐頁註記。2026-10-22 依上一版重建。
