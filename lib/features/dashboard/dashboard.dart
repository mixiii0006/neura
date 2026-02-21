import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime today = DateTime.now();
  final String username = "Mixxie";

  final List<Map<String, dynamic>> timelineData = [
    {
      "time": "06:00",
      "title": "Morning Routine",
      "subtitle": "Stretch + Water",
      "icon": Icons.wb_sunny,
      "color": Colors.orange,
    },
    {
      "time": "07:00",
      "title": "Workout",
      "subtitle": "Push + Pull",
      "icon": Icons.fitness_center,
      "color": Colors.green,
    },
    {
      "time": "09:00",
      "title": "Trading",
      "subtitle": "EURUSD Analysis",
      "icon": Icons.show_chart,
      "color": Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HERO SECTION
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff7C4DFF), Color(0xff00E5FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, $username",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${today.day}/${today.month}/${today.year} • Today",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Keep building your identity.",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),

                    // RIGHT STREAK
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 0.85,
                            strokeWidth: 6,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "6",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "days",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // WEEK CALENDAR
            TableCalendar(
              focusedDay: today,
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  today = selectedDay;
                });
              },
            ),

            const SizedBox(height: 10),

            // TIMELINE
            Expanded(
              child: ListView.builder(
                itemCount: timelineData.length,
                itemBuilder: (context, index) {
                  final item = timelineData[index];

                  return timelineTile(
                    time: item["time"],
                    title: item["title"],
                    subtitle: item["subtitle"],
                    icon: item["icon"],
                    color: item["color"],
                    isLast: index == timelineData.length - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timelineTile({
    required String time,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required bool isLast,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TIME
          SizedBox(
            width: 55,
            child: Text(time, style: const TextStyle(color: Colors.grey)),
          ),

          // LINE + DOT
          Column(
            children: [
              Container(
                height: 6,
                width: 2,
                color: Colors.grey.withOpacity(0.3),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(icon, size: 14, color: Colors.white),
              ),
              if (!isLast)
                Container(
                  height: 50,
                  width: 2,
                  color: Colors.grey.withOpacity(0.3),
                ),
            ],
          ),

          const SizedBox(width: 12),

          // GLASS CARD
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: color.withOpacity(0.7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
