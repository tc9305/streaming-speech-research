# Speech LLM

以 LLaMA-Omni 的實作建立架構理解，再決定後續研究方向。

- 負責人：Chiang（tc9305）
- 目前進度：英文語音互動流程已跑通；已整理 12 筆初步任務測試與 1 筆額外對照。
- 研究問題：同一份權重對語音回應、轉寫、翻譯與文字對照的行為有何不同？
- 閱讀狀態：研究者已自行讀至論文 v1 §2.6 Inference；§3 起尚未閱讀。筆記也參考實作、AI 討論與官方資料核對。
- 下一步：回收原始執行紀錄並核對提示內容；尚未進行微調或 streaming ST。

## 本次進度

- [架構理解、手繪圖修正與完整結果](llama-omni/2026-10-08-progress.md)
- [結構化紀錄（對話重建，非原始日誌）](llama-omni/results.json)
- [網頁閱讀版](index.html)
- [Quarto 簡報原稿](llama-omni/slides.qmd)與[網頁簡報](llama-omni/slides.html)：論文導讀到 §2.6，附錄保留 12 筆原樣輸出。

更新簡報時先安裝 [Quarto](https://quarto.org/docs/download/)，在 repo 根目錄執行：

```powershell
quarto render Chiang/SpeechLLM/llama-omni/slides.qmd
```

簡報的 Reveal.js 資源另外存於 `llama-omni/slides_files/`，以便 VS Code Live Server 正常載入。先在 Chiang 更新原稿和網頁，再同步到 `docs/Chiang/SpeechLLM/` 發布。

在 repo 根目錄執行 `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/sync_chiang_pages.ps1`。線上報告位於 `https://tc9305.github.io/streaming-speech-research/Chiang/SpeechLLM/index.html`；簡報位於 `https://tc9305.github.io/streaming-speech-research/Chiang/SpeechLLM/llama-omni/slides.html`。

輸出中文不等於忠實翻譯；目前證據不足以把失敗歸因於 adaptor 或否定架構能力。音訊與模型權重不納入 Git。
