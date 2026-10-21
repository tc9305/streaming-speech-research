# 來源與核對紀錄

核對日期：2026-10-21。會議日期：2026-10-22。簡報內數字若不是頁數、日期或方法定義，均不作自有實驗結果。全部 A–J 提案尚待驗證。

## 必讀分析資料快照

以下為讀取 GitHub main 時取得的原文快照，保留原文，不修正其中假設。它們是文獻研究與選題分析，**不是使用者已完成的模型實驗**。

| 本地快照 | 原始位置 | Git blob SHA |
|---|---|---|
| [SimulST_StreamST_研究選題討論稿.md](sources/SimulST_StreamST_研究選題討論稿.md) | [GitHub 原文](https://github.com/SigSpeechAI-NTNU/Shuo-Wun_SimulST/blob/main/research/SimulST_StreamST/SimulST_StreamST_%E7%A0%94%E7%A9%B6%E9%81%B8%E9%A1%8C%E8%A8%8E%E8%AB%96%E7%A8%BF.md) | `6a33e019e1cd78572b9100e19863f68b6f5a5ecc` |
| [SimulST_StreamST_R2_2026-10-17.md](sources/SimulST_StreamST_R2_2026-10-17.md) | [GitHub 原文](https://github.com/SigSpeechAI-NTNU/Shuo-Wun_SimulST/blob/main/research/SimulST_StreamST/SimulST_StreamST_R2_2026-10-17.md) | `ced1cb26bee6b91b17aae2ea46876cba718eee37` |
| [SimulST_StreamST_R2_2026-10-20.md](sources/SimulST_StreamST_R2_2026-10-20.md) | [GitHub 原文](https://github.com/SigSpeechAI-NTNU/Shuo-Wun_SimulST/blob/main/research/SimulST_StreamST/SimulST_StreamST_R2_2026-10-20.md) | `60ff45d6950ad03bd27c882a9e2af7f793b1a470` |

採用：痛點清單、研究問題、對照與歸因意識。未採用：互相衝突的 GPU 數量／型號、訓練時數換算、投稿目標、題目排名、成功率與固定改善百分比、其他模型復現推薦。以本次使用者背景為準。

## 核心原文

| ID | 完整來源與版本 | 核對定位／使用範圍 |
|---|---|---|
| 1 | Yi Xing, Manli Yu, Pengfei Liu, Helen Meng. 2026. [Test-Time Adaptation of an Offline Multimodal Foundation Model for Simultaneous Speech Translation](https://aclanthology.org/2026.iwslt-1.27.pdf). IWSLT, pp. 238–246. | §2 架構、§3.1 資料範圍、§3.3.2 額度耦合、Table 5 的 CU 與五折驗證、第 245 頁 Limitations。 |
| 2 | Hieu Hoang, Amittai Axelrod. 2026. [Learning When to Commit from Partial Speech for End-to-End Simultaneous Speech Translation](https://arxiv.org/html/2610.02612v1). arXiv:2610.02612v1. | §3 前綴訓練與 confidence、§6 固定區塊／句界／校準標籤／未量實際 latency 等限制。 |
| 3 | Jiaxuan Luo, Siqi Ouyang, Jiaxing Xu, Lei Li. 2026. [RASST: Retrieval-Augmented Simultaneous Speech Translation](https://arxiv.org/html/2601.22777v2). arXiv:2601.22777v2, 2026-06-13. | §4 部分語音檢索與使用時機訓練。未沿用 R2 的 v1 標題／增益。 |
| 4 | Zeyu Yang, Satoshi Nakamura. 2026. [When to Use Extra Context: Evidence-Grounded Terminology Adaptation for Simultaneous Speech Translation](https://arxiv.org/html/2607.17766v1). arXiv:2607.17766v1. | §3.3 當下 evidence 選詞、詞形／縮寫等匹配。與 C 高度重疊，不能只改名稱宣稱創新。 |
| 5 | Maike Züfle et al. 2026. [The Role of Disfluencies in Speech Translation](https://arxiv.org/html/2608.02138v1). arXiv:2608.02138v1. | 口語不流暢與 self-repair 的語意保留；本簡報 fifteen/fifty 是自建示意，不冒充原文案例。 |
| 6 | Xi Xu, Wenda Xu, Siqi Ouyang, Lei Li. 2025. [CA*: Addressing Evaluation Pitfalls in Computation-Aware Latency for Simultaneous Speech Translation](https://aclanthology.org/2025.findings-naacl.393.pdf). Findings of NAACL, pp. 7077–7082. | §3–4 音訊接收與計算重疊、排隊時間；評估方法，非 A 的控制 baseline。 |

## 補充原文與官方頁

- [NeMo@IWSLT 2026](https://aclanthology.org/2026.iwslt-1.23.pdf)：Transducer ASR 與 LLM cascade、endpoint／prefix 流程。
- [InfiniSST](https://arxiv.org/html/2503.02969)：§3.5 bounded cache 與多輪串流。本簡報不引用其增益或硬體數字。
- [StreamUni v2](https://arxiv.org/abs/2507.07803v2)：串流生成與歷史處理相關背景。
- [LegoSLM](https://aclanthology.org/2025.findings-emnlp.985/)：Rao Ma, Tongzhou Chen, Kartik Audhkhasi, Bhuvana Ramabhadran，2025。CTC posterior 介面，不等於 RNN-T posterior 已有相同效果。
- [CAAT](https://aclanthology.org/2021.emnlp-main.4/)：Dan Liu, Mengge Du, Xiaoxi Li, Ya Li, Enhong Chen，2021。Cross Attention Augmented Transducer Networks for Simultaneous Translation。
- [Transducer-Llama](https://arxiv.org/abs/2412.16464)：ASR 的 LLM／Factorized Transducer 整合。不是本案控制通道或輔助翻譯訓練的實驗證明。
- [HPO](https://arxiv.org/abs/2604.21045v1)：品質與延遲後訓練的鄰近方法，未推薦作起始復現。
- [Qwen3-Omni-30B-A3B-Instruct 官方模型頁](https://huggingface.co/Qwen/Qwen3-Omni-30B-A3B-Instruct)：確認原論文骨幹對應公開頁。未驗證本機載入或實驗室部署能力。

## 引用修正與證據邊界

1. R2 的 CAAT 連結 `2021.emnlp-main.555` 指向另一篇論文；正確為 `2021.emnlp-main.4`。只修正本簡報引用，未修改原始報告。
2. Xing 論文連結的 `owaski/iwslt-2026-baselines` 是競賽基線，不冒充 Xing 方法官方實作。完整程式與可重現版本仍待確認。
3. 原論文近期譯文 prefill 視窗不等於已實作無限串流 KV 淘汰。
4. 原論文 Table 5 報 CU LongYAAL，不能直接推論本實驗室的實際 latency 或成本。
5. 未查證的程式、checkpoint、資料可得性一律維持待確認。未找到同構方法不等於不存在。
6. 第 15 頁「仍需證明」與所有停止訊號都是本簡報提出的研究設計，非作者已證實的缺陷。

## 編輯與圖表

第 6 頁嵌入使用者提供的 A–J 路線圖 `assets/simulst-research-routes.png`，作為可替換的圖片資源。原有可編輯的四事件圖保留在備用 B6。其餘架構圖、時間線、翻譯軌跡與表格均在 QMD 中以 Markdown 或 HTML 文字表示，樣式由 CSS 控制，沒有捏造曲線。所有自建案例明標「示意」。
