import 'package:flutter/material.dart';
import 'package:post_carousel/post_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Carousel Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostCarouselExample(),
    );
  }
}

class PostCarouselExample extends StatelessWidget {
  const PostCarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Carousel Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Standard Carousel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            PostCarousel(
              items: [
                CarouselItem(
                  image:
                      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  title: 'Beautiful Landscape',
                  onTap: () {
                    debugPrint('Tapped on Landscape');
                  },
                ),
                CarouselItem(
                  image:
                      'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  title: 'City Lights',
                  onTap: () {
                    debugPrint('Tapped on City Lights');
                  },
                ),
                CarouselItem(
                  image:
                      'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  title: 'Serene Beach',
                  onTap: () {
                    debugPrint('Tapped on Beach');
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Auto-play Carousel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            PostCarousel(
              isAutoPlay: true,
              height: 250,
              items: [
                CarouselItem(
                  image:
                      'https://images.unsplash.com/photo-1517816161814-6014e365ce18?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  title: 'Cute Cat',
                ),
                CarouselItem(
                  image:
                      'https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80',
                  title: 'Adorable Dog',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
