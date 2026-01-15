import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_carousel/post_carousel.dart';

void main() {
  testWidgets('PostCarousel renders correctly', (WidgetTester tester) async {
    final items = [
      CarouselItem(image: 'http://example.com/1.jpg', title: 'Test 1'),
      CarouselItem(image: 'http://example.com/2.jpg', title: 'Test 2'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PostCarousel(items: items),
        ),
      ),
    );

    expect(find.byType(PostCarousel), findsOneWidget);
  });
}
