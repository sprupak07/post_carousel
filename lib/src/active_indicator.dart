import 'package:flutter/material.dart';

class ActiveIndicatorRect extends StatelessWidget {
  const ActiveIndicatorRect({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 20 : 10,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white.withValues(alpha: 0.9)
            : const Color(0xFF8E8E8E).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
