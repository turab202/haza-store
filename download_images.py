import requests
import os

# Create assets directory if it doesn't exist
os.makedirs('assets/images', exist_ok=True)

# Image URLs from Unsplash
image_urls = {
    'headphones.jpg': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
    'watch.jpg': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
    'tshirt.jpg': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=300&fit=crop',
    'fitness_tracker.jpg': 'https://images.unsplash.com/photo-1557438159-51eec7a6-9f6e-4f63-bc26-126b769adade?w=400&h=300&fit=crop',
    'mug.jpg': 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=400&h=300&fit=crop',
    'backpack.jpg': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=300&fit=crop'
}

for filename, url in image_urls.items():
    print(f'Downloading {filename}...')
    try:
        response = requests.get(url)
        response.raise_for_status()
        with open(f'assets/images/{filename}', 'wb') as f:
            f.write(response.content)
        print(f'✅ {filename} downloaded successfully!')
    except Exception as e:
        print(f'❌ Error downloading {filename}: {e}')

print('🎉 All images downloaded!')