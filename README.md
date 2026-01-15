# Post Carousel

A customizable Flutter package for displaying a carousel of featured posts with staggered animations.

## Features

- **Customizable Carousel**: Display a carousel of images with titles.
- **Staggered Animations**: Smooth entry animations for carousel items.
- **Active Indicator**: Visual indicator for the currently active item.
- **Cached Images**: Efficient image loading with caching support.
- **Html Support**: Render HTML titles on top of images.

## Getting started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  post_carousel: ^0.0.2
```

## Usage

Import the package:

```dart
import 'package:post_carousel/post_carousel.dart';
```

Create a list of `CarouselItem` and pass it to `PostCarousel`:

```dart
PostCarousel(
  items: [
    CarouselItem(
      image: 'https://example.com/image1.jpg',
      title: 'Beautiful Landscape',
      onTap: () {
        print('Tapped on Item 1');
      },
    ),
    CarouselItem(
      image: 'https://example.com/image2.jpg',
      title: 'City Lights',
    ),
  ],
)
```

## Additional parameters

- `height`: Height of the carousel container (default: 300).
- `isAutoPlay`: Enable auto-play (default: false).
- `autoPlayDuration`: Duration between auto-play slides (default: 3 seconds).

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

