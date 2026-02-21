import 'dart:ui';
import 'package:flutter/material.dart';

import '../features/dashboard/dashboard.dart';
import '../features/persona/persona.dart';
import '../features/projects/projects.dart';
import '../features/money/money.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  final screens = const [
    DashboardScreen(),
    PersonaScreen(),
    ProjectsScreen(),
    MoneyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],

      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navItem(icon: Icons.home_rounded, label: "Home", index: 0),
                  navItem(
                    icon: Icons.person_rounded,
                    label: "Persona",
                    index: 1,
                  ),
                  navItem(
                    icon: Icons.folder_rounded,
                    label: "Projects",
                    index: 2,
                  ),
                  navItem(
                    icon: Icons.attach_money_rounded,
                    label: "Money",
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },

      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: isActive ? 1 : 0),
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOutCubic,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            padding: EdgeInsets.symmetric(
              horizontal: isActive ? 20 : 12,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff7C4DFF).withOpacity(0.25 * value),
                  const Color(0xff00E5FF).withOpacity(0.25 * value),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff7C4DFF).withOpacity(0.18 * value),
                  blurRadius: 20 * value,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Color.lerp(
                    Colors.white.withOpacity(0.5),
                    Colors.white,
                    value,
                  ),
                ),
                if (isActive) ...[
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
