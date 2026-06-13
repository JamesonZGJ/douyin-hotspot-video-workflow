from pathlib import Path
import math

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
thumbs = sorted((ROOT / "analysis").glob("thumb_*.jpg"))
outdir = ROOT / "analysis" / "contact_sheets"
outdir.mkdir(exist_ok=True)

font = ImageFont.load_default()
cols, rows = 4, 5
cell_w, cell_h = 320, 210
per_sheet = cols * rows

for sheet_index in range(math.ceil(len(thumbs) / per_sheet)):
    batch = thumbs[sheet_index * per_sheet : (sheet_index + 1) * per_sheet]
    canvas = Image.new("RGB", (cols * cell_w, rows * cell_h), "black")
    draw = ImageDraw.Draw(canvas)

    for j, path in enumerate(batch):
        img = Image.open(path).convert("RGB")
        img.thumbnail((cell_w, cell_h - 24))
        col = j % cols
        row = j // cols
        x = col * cell_w + (cell_w - img.width) // 2
        y = row * cell_h + 22
        canvas.paste(img, (x, y))

        idx = int(path.stem.split("_")[1])
        sec = (idx - 1) * 10
        label = f"{idx:03d}  {sec // 60:02d}:{sec % 60:02d}"
        draw.rectangle(
            [col * cell_w, row * cell_h, (col + 1) * cell_w, row * cell_h + 20],
            fill=(0, 0, 0),
        )
        draw.text((col * cell_w + 6, row * cell_h + 4), label, fill=(255, 255, 255), font=font)

    canvas.save(outdir / f"sheet_{sheet_index + 1:02d}.jpg", quality=88)

print(f"created {len(list(outdir.glob('sheet_*.jpg')))} sheets in {outdir}")
