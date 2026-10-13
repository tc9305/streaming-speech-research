# SimulST — Consolidated Open Challenges

整合兩份研究問題清單，將原本的 **22 項問題**合併為 **6 大研究面向、14 項主要挑戰**。相同問題合併，互補問題整合，不同研究問題保留。

| 研究面向 | 整合後的主要問題（英文） | 核心問題 | 來源 |
|---|---|---|---|
| **A. Streaming Decision & Control** | **1. Quality–Latency Trade-off & Adaptive Policies** | 系統要等待多少音訊才能安全翻譯？如何根據語言、語速、歧義動態調整輸出策略？ | 共同 |
|  | **2. Segmentation & Boundary Mismatch** | VAD 的靜音邊界不等於語意或句法邊界，過早切分可能造成翻譯錯誤。 | 你 |
|  | **3. Long-Form Context & Buffer Management** | 無限音訊串流無法全部保留，如何選擇重要歷史資訊，同時協調 buffer 與模型輸出策略？ | 共同 |
|  | **4. Output Stability & Revision** | 太早提交容易出錯，允許重翻譯又可能造成字幕閃爍，如何平衡穩定性與修訂能力？ | 共同 |
| **B. Training & Supervision** | **1. Streaming Training Gap & Data Coverage** | 離線訓練資料缺少短前綴、靜音及同步翻譯情境，也缺乏 read/write 監督訊號。 | 共同 |
|  | **2. Temporal Alignment & Supervision Quality** | 合成翻譯與自動對齊的時間標記，不一定符合真人同步口譯時的決策。 | 同事 |
| **C. Evaluation & Latency** | **1. Real-World Latency & Compute-Aware Evaluation** | 模擬延遲可能忽略 chunk 等待、模型計算、字幕顯示，以及重新分段造成的測量誤差。 | 共同 |
|  | **2. Evaluation Metrics & Domain Sensitivity** | BLEU、COMET 與延遲指標可能給出不同結論，評估結果也受切句方式及評分器影響。 | 你 |
| **D. Robustness & Practical Deployment** | **1. Terminology & Proper Name Injection** | 專業術語首次出現時缺乏上下文，如何利用簡報、詞彙表或 PDF 協助模型辨識與翻譯？ | 共同 |
|  | **2. Domain & Accent Generalization** | 模型在特定演講資料表現良好，不代表面對不同口音、麥克風、背景噪音或對話也能維持品質。 | 共同 |
|  | **3. Multi-speaker & Overlapping Speech** | 多人會議的語者分離、交疊發言及持續翻譯，如何在即時條件下共同處理？ | 你 |
| **E. LLM Reliability & Optimization** | **1. LLM Hallucination & Repetition** | Speech LLM 可能補寫不存在的內容、重複生成，或在 prompt 與 buffer 邊界產生錯誤。 | 同事 |
|  | **2. Reward–Objective Misalignment** | 最佳化 BLEU 與 latency reward，不一定能改善忠實度、穩定性與真實使用體驗。 | 同事 |
| **F. Human-Centered Evaluation** | **1. Human Caption Comprehension** | 即使翻譯分數很高，字幕頻繁變動或雙語字幕過載，仍可能使使用者無法理解。 | 你 |

## 六大研究面向速覽

| 研究面向 | 涵蓋主題 |
|---|---|
| **A. Streaming Decision & Control** | Quality–Latency、Segmentation、Buffer、Revision |
| **B. Training & Supervision** | Training-data Coverage、Temporal Alignment |
| **C. Evaluation & Latency** | Real-world Latency、Metric Reliability |
| **D. Robustness & Practical Deployment** | Terminology、Domain Shift、Multi-speaker Speech |
| **E. LLM Reliability & Optimization** | Hallucination、Repetition、Reward Alignment |
| **F. Human-Centered Evaluation** | Caption Comprehension、Cognitive Load |

## 研究問題之間的關聯

SimulST 的問題不只是翻譯品質與延遲之間的取捨，而是串流決策、上下文管理、訓練方式及評估方法彼此相互影響。

- **Segmentation**：決定模型什麼時候取得足夠上下文。
- **Policy**：決定什麼時候輸出翻譯。
- **Buffer**：決定模型還能參考哪些歷史內容。
- **Revision**：決定已經輸出的字幕能否修改。
- **Latency Evaluation**：評估上述策略是否真正改善即時性。

其中 **Model Policy × Buffer Interaction** 可作為連結多項核心挑戰的系統層研究視角。
