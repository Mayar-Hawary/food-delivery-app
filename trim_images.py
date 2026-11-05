from PIL import Image, ImageChops
import os, sys

folder = sys.argv[1]
SKIP = {"classic_burger.png", "Mayar_Hawary.png", "notfound.png"}

for name in os.listdir(folder):
    if not name.lower().endswith(".png") or name in SKIP:
        continue
    path = os.path.join(folder, name)
    img = Image.open(path).convert("RGBA")

    bbox = img.getchannel("A").getbbox()
    if bbox == (0, 0, img.width, img.height):
        # خلفية مش شفافة: اقص على أساس لون الركن
        bg = Image.new("RGBA", img.size, img.getpixel((0, 0)))
        diff = ImageChops.difference(img, bg).convert("L").point(lambda p: 255 if p > 25 else 0)
        bbox = diff.getbbox()

    if bbox:
        img.crop(bbox).save(path)
        print("trimmed:", name, bbox)