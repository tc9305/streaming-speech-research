# Liu 報告

每份報告使用獨立資料夾與 Quarto 設定。三份報告皆備有可直接開啟的 HTML；report03 已由 Quarto 渲染。

```text
report/
├── report/                 # Nemotron 3.5 Streaming ASR
│   ├── report.qmd / report.html
│   ├── _quarto.yml / styles.css
│   ├── results-table.qmd / results-summary.qmd
│   ├── assets/             # 架構圖、截圖、CER 圖
│   ├── data/               # chunk_results.csv
│   ├── scripts/            # 更新數據、修正講者預覽
│   └── requirements.txt
├── report02/               # SimulST 研究挑戰與成熟度
│   ├── report02.qmd / report02.html
│   ├── _quarto.yml / styles.css / report02.css
│   └── SimulST*.png        # 兩張報告圖片
└── report03/               # T1、T2、T6 研究提案
    ├── report03.qmd / report03.html
    └── _quarto.yml / styles.css / report03.css
```

## 預覽與輸出

安裝 Quarto CLI 後，在儲存庫根目錄執行（將 report03 換成 report 或 report02 可操作其他報告）：

```sh
quarto preview Liu/report/report03/report03.qmd
quarto render Liu/report/report03/report03.qmd
```

或進入該份報告資料夾後執行：

```sh
cd Liu/report/report03
quarto preview report03.qmd
quarto render
```

輸出的 HTML 放在同一份報告資料夾，內嵌資源，可離線開啟。方向鍵換頁、Esc 總覽、F 全螢幕、S 講者模式。講者模式建議透過 `quarto preview` 開啟。

## 第一份報告的資料更新

第一份報告的 pre-render 會根據 `data/chunk_results.csv` 更新結果表、摘要與 CER 圖，因此需先安裝 Python 依賴：

```sh
cd Liu/report/report
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r requirements.txt
quarto render
```

其 post-render 會修正 `report.html` 的內嵌講者預覽。report02 不執行這些腳本；report03 使用自己的 `scripts/fix_slide_preview.py`，渲染後自動修正 Live Server 對內嵌講者程式的干擾，不執行資料更新。各報告的 `styles.css` 可獨立調整。

`../../research/r2_7.md`（相對 report03 資料夾）仍是第三份報告的研究內容來源。第三份報告為研究提案，未包含新實驗結果。

## 網站同步

儲存庫的 `scripts/sync_reports.ps1` 已指向第一份報告的新位置，發布目的地仍為 `docs/Liu/report.html`，保留既有網站網址。這次資料夾整理未重新發布網站。
