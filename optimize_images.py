import os
from PIL import Image

def optimize_images(directory):
    for filename in os.listdir(directory):
        if filename.lower().endswith(('.png', '.jpg', '.jpeg')):
            filepath = os.path.join(directory, filename)
            try:
                with Image.open(filepath) as img:
                    # Convert to RGB if necessary (e.g. for PNG with transparency if saving as JPG, 
                    # but we are saving as PNG so RGBA is fine, but resizing is key)
                    
                    # Resize if width > 1200
                    if img.width > 1200:
                        ratio = 1200 / float(img.width)
                        new_height = int(float(img.height) * ratio)
                        img = img.resize((1200, new_height), Image.Resampling.LANCZOS)
                    
                    # Save with optimization
                    # Overwrite the file
                    img.save(filepath, optimize=True, quality=85)
                    
                    print(f"Optimized: {filename}")
            except Exception as e:
                print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
    optimize_images('assets/images/blog')
    optimize_images('assets/images') # Also logos
