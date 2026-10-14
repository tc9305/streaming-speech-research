# Streaming Speech Research

從 SimulST 出發，延伸探索 StreamST 與 Speech LLM 的共同研究與學習紀錄。各主題保留研究筆記、簡報、實驗與 demo，透過 GitHub Pages 串起閱讀入口。

## 研究入口

| 主題 | 內容 | 進度 |
| --- | --- | --- |
| [SimulST](SimulST/README.md) | Papi et al. (2025) 論文理解與報告簡報 | 已有簡報 |
| [StreamST](StreamST/README.md) | 串流語音翻譯研究與實驗 | 已有術語筆記；實驗待開始 |
| [SpeechLLM（Chiang）](Chiang/SpeechLLM/README.md) | Speech LLM 架構研究、實作與 demo | 已有 LLaMA-Omni 架構筆記與初步測試 |

## 貢獻者與報告

| 研究者 | 研究原稿 | 給老師的網頁／簡報 |
| --- | --- | --- |
| Chiang | [Chiang/](Chiang/README.md) | [LLaMA-Omni 進度](Chiang/SpeechLLM/index.html) |
| Liu | [Liu/](Liu/README.md) | [Nemotron 3.5 Streaming ASR](docs/Liu/report.html) |
| Chiu | [chiu/](chiu/README.md) | [SeamlessStreaming / EMMA](docs/chiu/seamless_streaming_progress.html) |

共同背景依主題整理，個人延伸依研究者整理；三人的報告都可從網站首頁進入。既有 `Liu` 與 `chiu` 大小寫保留，連結須使用相同大小寫。

## 共用術語筆記

[SimulST／StreamST 術語與閱讀判斷規則](notes/terminology.md) · [網頁閱讀版](https://tc9305.github.io/streaming-speech-research/notes/terminology.html)

比較 StreamAtt 2024 與 TACL 2025 的用語，整理輸入、分段方式、架構、輸出與評估。資料夾名稱是研究整理方式，不代表 SimulST 與 StreamST 是互斥的標準分類。

網站首頁：https://tc9305.github.io/streaming-speech-research/

GitHub repository：[tc9305/streaming-speech-research](https://github.com/tc9305/streaming-speech-research)。

## 資料夾

```text
README.md           # 研究與協作入口
SimulST/            # 共同論文簡報原稿、圖解與說明
StreamST/           # 共同串流翻譯主題入口
Chiang/SpeechLLM/   # Chiang 的研究筆記與實驗紀錄
Liu/                # Liu 的 Quarto 原稿、資料與本機簡報
chiu/               # Chiu 的 Quarto 原稿、圖解與本機簡報
notes/              # 跨主題共用筆記原稿
docs/               # GitHub Pages 網站：手寫入口與發布產物
scripts/            # 共用產生／發布腳本
```

## 預覽與發布

首頁為 `docs/index.html`。`docs` 是網站發布根目錄，不是另一套研究筆記；`notes` 是共用筆記原稿。來源和網頁版呈現相同內容是正常的，請更新原稿後再產生網頁，避免兩份各自修改。完整盤點與維護對照見 [架構與重複內容檢查](notes/repository-structure.md)。

首頁、StreamST 入口與 Chiang 的 SpeechLLM 報告目前是手寫 HTML；其餘簡報／術語網頁為產生或同步的發布版本。Chiang 的網頁和簡報現僅存於 `Chiang/SpeechLLM/`，可用 Live Server 從該目錄預覽。

安裝 Quarto 後，在 repo 根目錄執行：

```sh
cd SimulST
quarto preview index.qmd
quarto render
```

SimulST 簡報輸出至根目錄 `docs/SimulST/index.html`。修改首頁或手寫報告時，直接編輯對應 HTML；Chiang 的網頁報告位於 `Chiang/SpeechLLM/index.html`，目前仍需與 Markdown 原稿同步維護。

Liu、Chiu 的簡報先在各自資料夾依 README 執行 Quarto 渲染，再回到 repo 根目錄同步現有 HTML 至網站（PowerShell）：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/sync_reports.ps1
```

此指令只對本次 PowerShell 程序允許執行腳本，不變更系統執行原則。腳本只複製兩人的現有內嵌資源 HTML，不修改研究原稿，也不重新執行實驗。`docs/Liu/report.html` 與 `docs/chiu/seamless_streaming_progress.html` 不應手動修改。若未來改為外部資源，需同時調整同步腳本。

共用術語頁由 `notes/terminology.md` 產生。在 repo 根目錄執行 `python scripts/build_terminology.py`（需 Python 與 Quarto），再將 Markdown 原稿與 `docs/notes/terminology.html` 一起提交。

GitHub Pages 由 [發布工作流程](.github/workflows/pages.yml)產生：執行 `node scripts/build_pages.mjs`，把 `docs/` 的網站與 `Chiang/SpeechLLM/` 合成暫時的 `.pages-build/`，再部署至 Pages。原稿及網頁只在 Chiang 維護一份；`.pages-build/` 不提交。GitHub Pages 的 Source 必須設為 **GitHub Actions**。

## 一起研究

- 各主題 README 記錄研究問題、負責人、目前進度與下一步。
- 用 Issue 記錄論文疑問、實驗想法與待討論事項。
- 透過 branch 與 PR 提交變更，說明新增的理解或實驗結果。
- 維護者可邀請隊友成為 collaborator，共同參與研究。

模型權重、資料集與大型音訊請放在 Git 之外，保留取得方式與必要範例。需要推論服務的 demo 可由主題入口連到另外運行的服務。
