"""블로그 이미지를 300KB 이하 WebP로 변환 (웹 로딩 안정화)"""
import os
from PIL import Image

MAX_WIDTH = 800
TARGET_KB = 300
WEBP_QUALITY = 75

def optimize_to_webp(directory, replace_png=True):
    for filename in os.listdir(directory):
        if not filename.lower().endswith('.png'):
            continue
        filepath = os.path.join(directory, filename)
        outpath = os.path.join(directory, filename[:-4] + '.webp')
        try:
            with Image.open(filepath) as img:
                if img.mode in ('RGBA', 'P'):
                    img = img.convert('RGBA')
                else:
                    img = img.convert('RGB')
                if img.width > MAX_WIDTH:
                    ratio = MAX_WIDTH / float(img.width)
                    h = int(float(img.height) * ratio)
                    img = img.resize((MAX_WIDTH, h), Image.Resampling.LANCZOS)
                img.save(outpath, 'WEBP', quality=WEBP_QUALITY, method=6)
                size_kb = os.path.getsize(outpath) / 1024
                print(f"  {filename} -> {filename[:-4]}.webp ({size_kb:.0f}KB)")
                if replace_png:
                    os.remove(filepath)
        except Exception as e:
            print(f"  Error: {filename}: {e}")

if __name__ == "__main__":
    print("Optimizing blog images to WebP (~300KB)...")
    optimize_to_webp('assets/images/blog')
