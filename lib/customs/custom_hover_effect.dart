import 'package:flutter/material.dart';

class CustomHoverEffect extends StatefulWidget {
  final String imageUrl;
  final double width;
  final BorderRadiusGeometry? borderRadius;

  const CustomHoverEffect({super.key, required this.imageUrl, required this.width, this.borderRadius});

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<CustomHoverEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.95).animate(_controller); // Adjust the end scale factor as needed
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startHoverAnimation() {
    _controller.forward();
  }

  void _endHoverAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _startHoverAnimation(),
      onExit: (_) => _endHoverAnimation(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                width: widget.width,
              ),
            ),
          );
        },
      ),
    );
  }
}
