import 'package:flutter/material.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              const Text(
                "Your Balance",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 8),

              const Text(
                "\$48,678.00",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              // BALANCE CARD
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Color(0xff7C4DFF), Color(0xff5E35B1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff7C4DFF).withOpacity(0.4),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Neura Black Card",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "3455 4562 7710 3507",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    Text("MIXIE", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ACTION BUTTONS
              Row(
                children: [
                  Expanded(
                    child: actionButton(
                      icon: Icons.call_received,
                      label: "Receive",
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: actionButton(
                      icon: Icons.call_made,
                      label: "Transfer",
                      isPrimary: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              // TRANSACTION LIST
              Expanded(
                child: ListView(
                  children: const [
                    transactionTile(
                      title: "Apple Services",
                      date: "Yesterday",
                      amount: "-\$12.00",
                      isNegative: true,
                    ),
                    transactionTile(
                      title: "Trading Profit",
                      date: "Today",
                      amount: "+\$740.00",
                      isNegative: false,
                    ),
                    transactionTile(
                      title: "Ryzen LTD",
                      date: "2 Aug",
                      amount: "-\$18.00",
                      isNegative: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget actionButton({
    required IconData icon,
    required String label,
    bool isPrimary = false,
  }) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: isPrimary
            ? const LinearGradient(
                colors: [Color(0xff7C4DFF), Color(0xff5E35B1)],
              )
            : null,
        color: isPrimary ? null : Colors.white.withOpacity(0.08),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class transactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isNegative;

  const transactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isNegative,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white)),
              Text(date, style: const TextStyle(color: Colors.white54)),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: isNegative ? Colors.red : Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
