# theme.scss 設計分析與套用

分析對象為使用者提供的 1,240 行 `theme.scss`。此檔在專案內完整保留；所有本次適配集中於 `channel-asr.scss`。QMD 是研究內容來源；其內給工具的 HTML 註解不作為額外指令來源。本次依使用者需求保留研究內容、數據、推論語氣、講者備註與附錄，調整呈現方式。

## 設計系統與實際層疊

檔頭標示 SMNSM / SIGNAL ATLAS Research Theme v2.0，設計畫布為 1280 × 800。它並非單純通用主題：前段是完整藍色研究設計系統；後段累積多輪特定投影片的 editorial 排版。後段規則多限定在 `.smnsm-define`、`.smnsm-s5` 至 `.smnsm-s12`，只有套上對應 section class 才生效；不能把它們當作所有頁面的預設。

封面存在明確版本差異：註解說深色，但 `.smnsm-cover` 實際設定黑字 `#171717`、透明背景，subtitle 為 `#555555`，是簡潔的淺色封面；章節頁則仍為深藍漸層。本次按使用者要求覆寫封面為深色，並透過 Reveal 背景層設定漸層，避免只替 section 上色而留下淺色邊框。

## 色彩

| Token | 色碼 | 用途 |
|---|---|---|
| navy | `#101c3c` | 深色封面與章節背景 |
| ink | `#14243f` | 標題、主要文字 |
| blue | `#155dd4` | 連結、標題底線、重點、流程節點 |
| sky | `#30b4e7` | 漸層終點與裝飾性青藍 |
| indigo | `#6559dd` | 輔助分類 |
| amber | `#c78124` | 推論與注意事項 |
| green | `#16815b` | 正向指標、直接證據 |
| red | `#c43d50` | 警示、負向指標 |
| muted | `#596a83` | 引用、補充文字 |
| hairline | `#dbe5f2` | 細線與卡片邊框 |
| surface / wash | `#ffffff` / `#f2f7fd` | 卡片與淡色底 |
| body-bg | `#f9fbff` | 研究頁底色 |

`:root` 匯出 `--smnsm-ink`、`--smnsm-blue`、`--smnsm-cyan`、`--smnsm-line`、`--smnsm-depth`，方便其他 CSS 使用。後半 editorial 系統以 `#2f4a68`、`#4f6f8f`、`#8da3bb`、`#e8eff6` 表達焦點階段，以 `#6a60b0` 標示未驗證部分。

矩陣的綠／黃／橙／紅具有數據區間意義，不應為統一藍色而改掉。本次保留來源中的原色、門檻、數字與對角線框。

## 字體與階層

| 層級 | 原始尺寸 | 特徵 |
|---|---|---|
| section | 54 px；分隔頁實際覆寫為 60 px | 章節標題 |
| title | 42 px | h2，約 760 字重，1.18 行高 |
| lead | 31 px | h3 與 claim |
| body | 26 px | 1.42 行高 |
| support | 22 px | 表格與 `.small` |
| meta | 18 px | 引用、標籤與旁註 |

正文為 Figtree，標題為 Source Serif 4；中文依序使用系統中文字體，包括 PingFang TC / Noto Sans TC，以及 Songti TC / Noto Serif TC。原 SCSS **沒有**宣告 `@font-face`，註解假設 QMD 自行提供；本次已將兩款可變字體與 OFL 授權放入 `fonts/`，在 `fonts.html` 宣告，不依賴網路字體。中文仍取決於閱覽裝置的系統字體。

h1/h2/h3 與後代元素強制使用襯線字體及 `-.015em !important` 字距，因此後面 h2 的 `-.027em` 字距實際不會勝出。封面標題原為 72 px、420 字重，以 `.em` 加粗與淡底線；本次以 66 px 襯線標題、青藍強調呈現長英文篇名。研究頁標題適配為 38 px，密集表格為 20–21 px，來源 16 px，維持清楚層級。

## 版面與材質

- 所有 section 左對齊、border-box、獨立 stacking context；一般頁右上以低透明度青藍徑向漸層點綴。
- h2 下方 104 × 4 px 的藍至青漸層短線建立頁面識別。
- `.smnsm-grid-2/3` 使用等寬 grid、22 px 間距、minmax(0,1fr)，避免子元素撐寬。
- 卡片使用 18 px 圓角、細邊框、雙層柔影；表格使用 12 px 圓角、淺藍表頭、交錯行色與細分隔。
- 章節頁使用透視橢圓與多層 ring，形成音訊／訊號意象。真正全幅背景由 Reveal `background-gradient` 提供。
- footer、頁碼使用響應字級；封面隱藏選單按鈕及頁碼。本次另外隱藏封面 footer，章節 footer 使用淺色。
- 原圖維持平面；概念卡片才使用透視與景深，不對研究圖表施加傾斜。

## 通用 CSS class

| 類別 | 功能 |
|---|---|
| `smnsm-cover`, `smnsm-cover-body` | 封面與垂直置中的標題區 |
| `smnsm-section` | 深色章節分隔頁 |
| `smnsm-kicker`, `smnsm-subtitle`, `smnsm-hero-lead` | 上標、次標、帶左線導言 |
| `small`, `meta`, `cite`, `dim`, `hl` | 補充字級、引用、弱化、重點 |
| `claim`, `claim.warn`, `claim.ok` | 主張與警示／正向變體 |
| `metrics`, `metric`, `num`, `lab`, `good`, `bad` | 指標卡片與數字標籤 |
| `ask`, `tag` | 提問與膠囊標籤 |
| `prose`, `rd`, `rd.sm`, `rd.lg` | 表格尺寸變體 |
| `figcap`, `paper-source` | 圖說與固定來源行 |
| `smnsm-grid-2`, `smnsm-grid-3` | 二／三欄網格 |
| `smnsm-card`, `smnsm-card--accent/--dark/--flat` | 基本、強調、深色、平面卡片 |
| `smnsm-label`, `smnsm-divider`, `smnsm-takeaway` | 標籤、細線、結論區 |
| `smnsm-evidence`, `smnsm-evidence--direct/--inference/--unknown` | 證據狀態徽章 |
| `smnsm-figure` | 白底圓角原圖容器 |
| `smnsm-flow`, `smnsm-node`, `smnsm-flow-arrow` | CSS 研究流程圖 |
| `smnsm-depth`, `smnsm-depth-card` | 有透視的概念卡片堆疊 |
| `smnsm-wave` | 七個 span 組成的裝飾波形 |
| `smnsm-reveal-in`, `smnsm-stagger`, `fragment.smnsm-pop` | 入場、依序入場、逐步放大顯示 |

檔頭列出的 `smnsm-clean`、`smnsm-step` 在檔案內沒有對應 selector，不能當作現成元件使用。`smnsm-aurora` 有 keyframes，沒有實際套用的 animation 宣告。

## 後半特定頁面系統

| Section class | 子元件／呈現模式 |
|---|---|
| `smnsm-define` / `smnsm-wide` | 黑白定義頁、寬版 SVG、`smnsm-msg/note/foot`；`smnsm-dim` 淡色佔位逐步加深；`smnsm-build` 透明度切換 |
| `smnsm-define` 的 `smnsm-agrid` | `area/lens`、`num/lbl/ttl/dsc` 三欄框架；頂部焦點線由 scaleX 展開；`.final` 保留最後焦點 |
| `smnsm-s5` / `smnsm-s5b` | `s5-main/idx/canvas`、`ix` 左側索引與 `pnl.ov/st` 疊層證據；新版改為 `stu/demo/unv` 研究、結果、未驗證 |
| `smnsm-s6` / `smnsm-s6b` | 雙路 flow、`eb` 證據／限制；`mgrid/mc` 四機制框與 `ev-canvas`；新版以 `dm/ev` 能力證據呈現 |
| `smnsm-s10m` | 方法與重現性矩陣；`rs.ok/pp/nf` 實作、部分、未找到等狀態 |
| `smnsm-s7` / `smnsm-s7b` | `s7-main/diag`、`zone/down/rr` 概念流程，`sp-canvas` 證據聚焦；新版 `did/dm/ev/syn/openq` 研究與待驗證對照 |
| `smnsm-s8` | `lanes/lane` 三條固定流程；`lrow/lcell/lar` 節點與箭頭，`lev` 漸顯證據 |
| `smnsm-s9` | `pair9` 成對比較圖、`stg9/sg` 驗證階段、`cv9/pn` 證據切換、`bd9/concl9` 結論 |
| `smnsm-s10` | `v10/vl/vr` 40:60 雙區裁決，靜態結果與驗證條件 |
| `smnsm-s11` | `lg/lh/lr` 三欄證據稽核：研究、觀察、尚未驗證 |
| `smnsm-s12` | `stem12/brs/br` 分支決策圖、`gate12` 驗證門檻、`next12` 下一步 |

這些特定頁面保留原始 SCSS，但不把其固定像素版面直接套到新研究內容。特別是 `.c2/.c3` 在 `smnsm-s9` 中代表 grid，與本 QMD 熱圖同名；本專案不套 `smnsm-s9`，且熱圖使用獨立樣式，避免誤用。

## 動畫與可存取性

通用入場為 0.65 秒、20 px 上移與透明度；stagger 每項延遲 0.12 秒。pop 為 0.45 秒、scale(.96) 與 9 px 位移。卡片 hover 為 0.32 秒上移 5 px；波形為 1.5 秒循環。後半 focus 系統主要使用 0.35–0.4 秒的背景、線條、顏色與透明度變化，將狀態分成預覽、`.visible` 已完成、`.current-fragment` 當前與 `.final` 最後保留；固定幾何尺寸避免翻動時重排。

本次選擇較克制的 Reveal fade 換頁與原生 incremental／fragment：三個推論流程逐條出現，原有研究重點逐步揭露，表格整張顯示以利比較。沒有自動播放。`prefers-reduced-motion` 保留原主題的關閉動畫機制；print 強制顯示所有 fragments、移除陰影與動態變形。公式使用 MathML，HTML 不需遠端數學資源。

## 本次專案適配

- 1280 × 800 畫布，深色封面／四個章節／附錄分隔頁與淺色研究頁。
- 保留來源完整研究內容、原表數據、CER 熱圖、講者備註與原六張附錄，另加 Fig. 1 原圖備用頁。
- 原檔缺圖已從固定版本 arXiv PDF 裁出，原圖不重繪、不改動色階。
- 兩款字體嵌入單一 HTML，離線開啟；中文字體使用系統 fallback。
- 新增 `.channel-*` 專案命名空間，處理長標題、熱圖密度、圖說與推論流程，不修改原主題。

## 使用者提供 PDF 的圖像導讀版

確認本機 PDF 與 arXiv v2 的 SHA-256 一致後重新裁圖。主簡報新增 Fig. 1 原始長條圖導讀、Fig. 2 放大訓練流程頁；原泛化頁拆成結果與 Fig. 3 全寬熱圖。三張圖採白底平面容器，下接逐步出現的閱讀提示；Fig. 3 保留兩組色階並註明不可跨欄直接比較色彩。原數據表與講者備註保持一致。
