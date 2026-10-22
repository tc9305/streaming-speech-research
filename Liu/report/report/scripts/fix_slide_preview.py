"""Keep Live Server from injecting reload scripts into embedded speaker HTML."""

from pathlib import Path
import re


def fix_html(html: str) -> str:
    def escape_embedded_html(match: re.Match[str]) -> str:
        body = re.sub(r"</(body|head|html)\s*>", r"<\/\1>", match[2], flags=re.I)
        return match[1] + body + match[3]

    return re.sub(
        r"(<script\b[^>]*>)(.*?)(</script\s*>)",
        escape_embedded_html,
        html,
        flags=re.I | re.S,
    )


if __name__ == "__main__":
    slide = Path(__file__).resolve().parents[1] / "report.html"
    original = slide.read_bytes().decode("utf-8")
    fixed = fix_html(original)
    if fixed != original:
        slide.write_bytes(fixed.encode("utf-8"))
    print("StreamST: embedded speaker HTML is safe for Live Server preview.")
