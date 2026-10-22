# Zipformer_Second：第二輪研究與選題收斂

14 頁繁體中文 Quarto／Reveal.js 簡報，聚焦使用者提供的 `deep-research-report.md` 第 7 點排名 **1、2、4**，供與教授討論研究方向。每個方向用兩頁介紹方法與實驗，再比較風險、共同評測、兩週 Pilot 與待決策事項。沿用 `Zipformer_First` 的 1280 × 720、米白底、深藍／青綠樣式與中文講者筆記。

## 預覽

```sh
quarto preview Zipformer_Second.qmd
quarto render
```

直接開啟 `Zipformer_Second.html` 可離線觀看。方向鍵換頁、Esc 總覽、F 全螢幕、S 講者模式。

## 內容

- **排名 1** Acoustic-Confirmed Bilingual Term Gating：同一 shortlist 下，有無聲學 Gate。
- **排名 2** Time-Decayed Acoustic Hotword Memory：同一檢索與容量下，有無時間衰減。
- **排名 4** Term-Aware Commit Policy：同等延遲預算下，術語專屬提交決策的價值。

原排名不重新編號。建議以 1 為主線、2 為備案、4 為擴展，此為研究判斷，並非實驗排名。

## 檔案

- `Zipformer_Second.qmd`／`.html`：內容、中文講稿與離線簡報。
- `_quarto.yml`、`styles.css`：獨立專案設定及共用樣式。
- `assets/rank1-gate.svg`、`rank2-memory.svg`、`rank4-commit.svg`：可編輯方法示意圖。
- `sources/deep-research-report.md`：使用者原始報告，完整保留。
- `scripts/fix_slide_preview.py`：沿用 Live Server 講者 HTML 修正。

## 內容界線

本簡報沒有新實驗數字，排名與 Pilot 門檻均標為報告建議。直接核對 A2P、BR-ASR、Streaming CTC Word Spotting、InfiniSST 的原始出版頁及摘要；未宣稱完整重驗證原報告所有文獻或證明某題全球首創。原文內不透明的引用 token 不進入投影片，改用可開啟的正式來源連結。

補充釐清：A2P 不預設已支援因果 streaming；累積 prefix 中曾出現不等於目前有效，停用需定義局部時窗／有效期；時間消融需固定 shortlist 容量；已 commit 前綴不回改；草稿修訂與錯誤定稿分開評測；增加 matched-delay 對照排除純等待收益。StreamLAAL 定義與工具尚待核對，未提供量測值。資料、語言方向、授權與硬體仍待確認。

製作與原始資料核對日期：2026-10-22。
