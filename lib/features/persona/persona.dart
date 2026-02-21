import 'dart:math';
import 'package:flutter/material.dart';

class PersonaScreen extends StatefulWidget {
  const PersonaScreen({super.key});

  @override
  State<PersonaScreen> createState() => _PersonaScreenState();
}

class _PersonaScreenState extends State<PersonaScreen> {
  int level = 7;
  double xpProgress = 0.65;

  final List<Map<String, dynamic>> traits = [
    {"name": "Discipline", "value": 80},
    {"name": "Focus", "value": 70},
    {"name": "Consistency", "value": 65},
    {"name": "Execution", "value": 75},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F12),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // CHARACTER HEADER
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 220,
                    width: 220,
                    child: CustomPaint(painter: ArcPainter(xpProgress)),
                  ),

                  Column(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xff7C4DFF), Color(0xff00E5FF)],
                          ),
                        ),
                        child: const Icon(
                          Icons.psychology,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Level $level",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Mixxie",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Identity: Cyber Strategist",
                style: TextStyle(color: Colors.white54),
              ),

              const SizedBox(height: 30),

              // TRAITS SECTION
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Core Traits",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Column(
                children: traits.map((trait) {
                  return traitBar(trait["name"], trait["value"]);
                }).toList(),
              ),

              const SizedBox(height: 30),

              // ACHIEVEMENTS
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Achievements",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  achievementCard(Icons.local_fire_department, "7 Day Streak"),
                  achievementCard(Icons.code, "Built NEURA"),
                  achievementCard(Icons.trending_up, "Profitable Week"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget traitBar(String title, int value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 6),
          Container(
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white12,
            ),
            child: FractionallySizedBox(
              widthFactor: value / 100,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [Color(0xff7C4DFF), Color(0xff00E5FF)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget achievementCard(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.05),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double progress;

  ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final backgroundPaint = Paint()
      ..color = Colors.white12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xff7C4DFF), Color(0xff00E5FF)],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, pi, pi, false, backgroundPaint);

    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
