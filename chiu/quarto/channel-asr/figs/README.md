# 論文原圖

來源：[arXiv:2508.08967v2 PDF](https://arxiv.org/pdf/2508.08967v2)。圖像權利屬原作者；這裡裁切原圖作論文導讀並標註來源，未重繪數據或更動色階。

- `fig1.png`：PDF 第 2 頁 Fig. 1；保留座標軸與圖例，用於新增的備用附錄。
- `fig2.png`：PDF 第 2 頁 Fig. 2；保留 Teacher、adapter、MSE loss 與所有流程標籤。
- `fig3.png`：PDF 第 6 頁 Fig. 3；保留四宮格、兩組不同色階、時間軸與 HAT/TAT 標示。

在 macOS 使用 PDFKit 重現裁切（不需 Python 套件）：

```sh
curl -L https://arxiv.org/pdf/2508.08967v2 -o /tmp/channel-asr-paper.pdf
swift scripts/extract-figures.swift figs /tmp/channel-asr-paper.pdf
```

腳本內矩形座標以 PDF 左上角為原點，一般採 3 倍解析度、放大的 Fig. 2 採 6 倍解析度輸出 PNG；圖片裁切不包含長篇原始圖說，簡報中另有中文圖說及來源。

本次已使用使用者本機提供的 PDF 重新裁圖。其 SHA-256 為 `dc57a0811feea22cb053e79382173b843683d4e6640ade0c572b49ef9505d12b`，與上述 arXiv 固定版本完全一致。
