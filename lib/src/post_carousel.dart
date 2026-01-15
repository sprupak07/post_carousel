// Copyright 2023  Rupak Sapkota. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:post_carousel/src/active_indicator.dart';
import 'package:post_carousel/src/carousel_item.dart';
import 'package:post_carousel/src/featured_post.dart';

/// A widget that displays a carousel of featured posts with staggered animations.
///
/// The [PostCarousel] widget takes a list of [CarouselItem]s and displays them
/// in a horizontally scrollable page view with staggered animations. It supports
/// auto-play and customizable height.
class PostCarousel extends StatefulWidget {
  /// The list of items to display in the carousel.
  final List<CarouselItem> items;

  /// The height of the carousel widget.
  ///
  /// Defaults to 300.
  final double height;

  /// Whether the carousel should automatically play.
  ///
  /// Defaults to false.
  final bool isAutoPlay;

  /// The duration to wait before auto-playing to the next item.
  ///
  /// Defaults to 3 seconds.
  final Duration autoPlayDuration;

  /// Creates a [PostCarousel] instance.
  const PostCarousel({
    Key? key,
    required this.items,
    this.height = 300,
    this.isAutoPlay = false,
    this.autoPlayDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  late PageController _controller;
  int _currentIndex = 0;
  Timer? _timer;

  _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.85,
      initialPage: _currentIndex,
    );

    if (widget.isAutoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayDuration, (timer) {
      if (_controller.hasClients) {
        if (_currentIndex < widget.items.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        _controller.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              final item = widget.items[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FeaturedPost(
                  image: item.image,
                  title: item.title,
                  onTap: item.onTap,
                  isActive: _currentIndex == index,
                ),
              );
            },
            onPageChanged: _onPageChange,
          ),
        ),

        const SizedBox(height: 10),

        /// Active Indicators
        if (widget.items.length > 1)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (index) => ActiveIndicatorRect(
                  isActive: _currentIndex == index,
                ),
              ).toList(),
            ),
          ),
      ],
    );
  }
}
