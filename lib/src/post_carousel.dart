// Copyright 2023  Rupak Sapkota. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:post_carousel/src/active_indicator.dart';
import 'package:post_carousel/src/featured_post.dart';

class PostCarousel extends StatefulWidget {
  final int length;

  final onTap;
  final String? title;
  final String? content;
  final images;

  const PostCarousel({
    Key? key,
    required this.length,
    this.onTap,
    this.title,
    this.content,
    this.images,
  }) : super(key: key);

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  late PageController _controller;

  int _currentIndex = 1;

  _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FeaturedPost(
                  image: widget.images[index],
                  title: widget.title,
                  content: widget.content,
                  onTap: widget.onTap,
                  isActive: _currentIndex == index,
                ),
              );
            },
            onPageChanged: _onPageChange,
          ),
        ),

        /// Active Indicators
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.length,
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
