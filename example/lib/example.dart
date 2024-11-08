import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ARCTextScreen(),
    );
  }
}

class ARCTextScreen extends StatefulWidget {
  const ARCTextScreen({super.key});

  @override
  State<ARCTextScreen> createState() => _ARCTextScreenState();
}

class _ARCTextScreenState extends State<ARCTextScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ARC Text"),
      ),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
          child: const ArcText(
            radius: 100,
            text: "Arc text for making app logo with animations or more.",
            textStyle: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class ArcText extends StatelessWidget {
  const ArcText({
    super.key,
    required this.radius,
    required this.text,
    required this.textStyle,
    this.startAngle = 0,
  });

  final double radius;
  final String text;
  final double startAngle;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _ArcTextPainter(
      radius,
      text,
      textStyle,
      initialAngle: startAngle,
    ),
  );
}

class _ArcTextPainter extends CustomPainter {
  _ArcTextPainter(this.radius, this.text, this.textStyle, {this.initialAngle = 0});

  final double radius;
  final String text;
  final double initialAngle;
  final TextStyle textStyle;

  final _textPainter = TextPainter(textDirection: TextDirection.ltr);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2 - radius);

    if (initialAngle != 0) {
      final d = 2 * radius * math.sin(initialAngle / 2);
      final rotationAngle = _calculateRotationAngle(0, initialAngle);
      canvas.rotate(rotationAngle);
      canvas.translate(d, 0);
    }

    double angle = initialAngle;
    for (int i = 0; i < text.length; i++) {
      angle = _drawLetter(canvas, text[i], angle);
    }
  }

  double _drawLetter(Canvas canvas, String letter, double prevAngle) {
    _textPainter.text = TextSpan(text: letter, style: textStyle);
    _textPainter.layout(
      minWidth: 0,
      maxWidth: double.maxFinite,
    );

    final double d = _textPainter.width;
    final double alpha = 2 * math.asin(d / (2 * radius));

    final newAngle = _calculateRotationAngle(prevAngle, alpha);
    canvas.rotate(newAngle);

    _textPainter.paint(canvas, Offset(0, -_textPainter.height));
    canvas.translate(d, 0);

    return alpha;
  }

  double _calculateRotationAngle(double prevAngle, double alpha) => (alpha + prevAngle) / 2;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
