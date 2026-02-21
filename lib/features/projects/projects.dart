import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "Cybersecurity",
        "desc": "Penetration testing & network study",
        "date": "28 Aug 7:00 PM",
        "gradient": const [Color(0xff2C2F48), Color(0xff1C1E2E)],
      },
      {
        "title": "Trading System",
        "desc": "Smart money & journaling",
        "date": "29 Aug 5:00 AM",
        "gradient": const [Color(0xff3A2D45), Color(0xff1F1B2E)],
      },
      {
        "title": "Language Learning",
        "desc": "Daily Japanese immersion",
        "date": "29 Aug 4:00 PM",
        "gradient": const [Color(0xff24343D), Color(0xff141E24)],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff0F0F12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Projects",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return projectCard(
                      context,
                      title: project["title"] as String,
                      desc: project["desc"] as String,
                      date: project["date"] as String,
                      gradient: project["gradient"] as List<Color>,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectCard(
    BuildContext context, {
    required String title,
    required String desc,
    required String date,
    required List<Color> gradient,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProjectDetailScreen(title: title)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                const Icon(Icons.star_border, color: Colors.white54),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            Text(desc, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  final String title;

  const ProjectDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F12),
      appBar: AppBar(
        backgroundColor: const Color(0xff0F0F12),
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Inside $title project",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
