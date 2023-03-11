import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FeaturedPost extends StatelessWidget {
  final String image;

  final String? title;
  final String? content;

  const FeaturedPost({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.image,
    this.title,
    this.content,
  }) : super(key: key);

  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: isActive ? 8.0 : 16,
      ),
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Hero(
                tag: 'featured_post',
                child: Image.network(image),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Html(
                          data: title,
                          style: {
                            'body': Style(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              fontSize: const FontSize(16),
                              lineHeight: const LineHeight(1.4),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              maxLines: 2,
                            ),
                            'figure': Style(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero),
                          },
                        ),
                      ),
                      const SizedBox(height: 1),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            Icons.timelapse,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
