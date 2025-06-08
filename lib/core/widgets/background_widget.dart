import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  final Color color;
  final double scale;
  final double spacing;
  final int seconds;

  const BackgroundWidget({
    super.key,
    this.color = Colors.blue,
    this.scale = .6,
    this.spacing = 16.0,
    this.seconds = 10,
  });

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.seconds),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: PointillismPainter(
            color: widget.color,
            scale: widget.scale,
            spacing: widget.spacing,
            time: _controller.value,
          ),
          size: size,
        );
      },
    );
  }
}

class PointillismPainter extends CustomPainter {
  final Color color;
  final double scale;
  final double spacing;
  final double time;

  PointillismPainter({
    required this.time,
    this.scale = 1.0,
    this.spacing = 12.0,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final step = spacing;
    final radius = scale * 2;
    for (double y = 0; y < size.height; y += step) {
      for (double x = 0; x < size.width; x += step) {
        final dx = 2 * sin((x * 0.01) + (time * 2 * pi));
        final dy = 2 * cos((y * 0.01) + (time * 2 * pi));
        canvas.drawCircle(Offset(x + dx, y + dy), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
