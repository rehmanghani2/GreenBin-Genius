import 'package:flutter/material.dart';
import 'impact_stories_screen.dart'; // Import the new screen

class GoalSelectionScreen extends StatelessWidget {
  const GoalSelectionScreen({super.key});

  final List<Map<String, dynamic>> goals = const [
    {
      'icon': Icons.lightbulb_outline_rounded,
      'title': 'Inspire Cleanups',
    },
    {
      'icon': Icons.trending_up_rounded,
      'title': 'Improve Data Quality',
    },
    {
      'icon': Icons.handshake_outlined,
      'title': 'Join a Cleanup',
    },
    {
      'icon': Icons.saved_search_rounded,
      'title': 'Track My Impact',
    },
    {
      'icon': Icons.gavel_rounded,
      'title': 'Change Policy',
    },
    {
      'icon': Icons.help_outline_rounded,
      'title': 'Not Sure',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Title
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: const [
                    TextSpan(text: 'What is your '),
                    TextSpan(
                      text: 'goal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: '?'),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Grid of Options
              Expanded(
                child: GridView.builder(
                  itemCount: goals.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    return _buildGoalCard(context, goals[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoalCard(BuildContext context, Map<String, dynamic> goal) {
    return InkWell(
      onTap: () {
        // Navigate to Impact Stories Screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ImpactStoriesScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              goal['icon'],
              size: 48,
              color: const Color(0xFF2196F3), // Brand Blue
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                goal['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}