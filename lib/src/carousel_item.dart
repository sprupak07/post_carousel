/// A model representing an item in the [PostCarousel].
class CarouselItem {
  /// The URL or asset path of the image to display.
  final String image;

  /// The title of the post or item.
  ///
  /// This can contain HTML tags which will be rendered.
  final String? title;

  /// The content or description of the item.
  final String? content;

  /// A callback function to be executed when the item is tapped.
  final Function()? onTap;

  /// Creates a [CarouselItem].
  CarouselItem({
    required this.image,
    this.title,
    this.content,
    this.onTap,
  });
}
