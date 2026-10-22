from pathlib import Path
import csv
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.ticker import PercentFormatter
ROOT = Path(__file__).resolve().parents[1]
with (ROOT / "data/chunk_results.csv").open(encoding="utf-8", newline="") as f:
    rows = list(csv.DictReader(f))
for row in rows:
    for key in ("chunk_ms", "substitutions", "deletions", "insertions", "reference_chars"):
        row[key] = int(row[key])
    if row["reference_chars"] <= 0:
        raise ValueError("reference_chars must be positive")
    row["cer"] = 100 * sum(row[k] for k in ("substitutions", "deletions", "insertions")) / row["reference_chars"]
    if abs(row["cer"] - float(row["cer_reported_percent"])) > .0051:
        raise ValueError("Screenshot CER and counts disagree")
rows.sort(key=lambda r: r["chunk_ms"])
lines = ["| Chunk | CER ↓ | S 替換 | D 刪除 | I 插入 | N 參考字數 | Attention<br>context | Audio<br>(s) | Runtime<br>(s) | RTF ↓ | RTFx ↑ |", "|---:|---:|---:|---:|---:|---:|:---:|---:|---:|---:|---:|"]
for r in rows:
    rtf_display = f"{float(r['rtf']):.3f}"
    rtfx_display = f"{float(r['rtfx']):.3f}"
    if r['chunk_ms'] in (320, 560):
        rtf_display = f"<b>{rtf_display}</b>"
        rtfx_display = f"<b>{rtfx_display}</b>"
    lines.append(f"| {r['chunk_ms']} ms | {r['cer']:.2f}% | {r['substitutions']} | {r['deletions']} | {r['insertions']} | {r['reference_chars']} | {r['att_context_size']} | {float(r['audio_duration_sec']):.6f} | {float(r['runtime_sec']):.2f} | {rtf_display} | {rtfx_display} |")
lines += ["", ": 不同 chunk 的辨識結果與執行效率；保留原辨識數據，新增本次執行數據。 {#tbl-results}", ""]
(ROOT / "results-table.qmd").write_text("\n".join(lines), encoding="utf-8")
first, best = rows[0], min(rows, key=lambda r:r['cer'])
pp = first['cer'] - best['cer']
rel = 100 * pp / first['cer']
text = f"本次最低 CER 出現在 **{best['chunk_ms']} ms：{best['cer']:.2f}%**。相較 {first['chunk_ms']} ms，降低 **{pp:.2f} 個百分點**\n"
(ROOT / "results-summary.qmd").write_text(text, encoding="utf-8")
plt.rcParams.update({'font.family':'DejaVu Sans', 'font.size':12, 'axes.spines.top':False, 'axes.spines.right':False, 'svg.fonttype':'none', 'figure.facecolor':'#faf9f6', 'axes.facecolor':'#faf9f6', 'text.color':'#153447', 'axes.labelcolor':'#153447', 'xtick.color':'#577083', 'ytick.color':'#577083'})
fig, ax = plt.subplots(figsize=(9.2,4.5),layout='constrained')
xs, ys = [r['chunk_ms'] for r in rows], [r['cer'] for r in rows]
ax.plot(xs,ys,color='#087f8c',marker='o',linewidth=2.5,markersize=9)
for x,y in zip(xs,ys):
    ax.annotate(f'{y:.2f}%',(x,y),xytext=(0,13),textcoords='offset points',ha='center',weight='bold',color='#123647')
ax.set(xticks=xs,ylim=(0,22),xlabel='Configured chunk size (ms)',ylabel='Character error rate (%)')
ax.yaxis.set_major_formatter(PercentFormatter(100,decimals=0))
ax.grid(axis='y',alpha=.2)
ax.set_title('Chunk size vs. CER',loc='left',fontweight='bold',pad=22)
fig.savefig(ROOT/'assets/chunk-cer.svg',bbox_inches='tight')
plt.close(fig)
print('Updated result table, summary, and plot from CSV.')
