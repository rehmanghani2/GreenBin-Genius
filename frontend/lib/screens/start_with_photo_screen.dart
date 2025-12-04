import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import Dashboard

// Placeholder for Login
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // For now, let's auto-navigate to Dashboard or show a button
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // REMOVED 'const' here to prevent constructor errors if Dashboard changes
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen())
            );
          },
          child: const Text("Login (Go to Dashboard)"),
        ),
      ),
    );
  }
}

class StartWithPhotoScreen extends StatelessWidget {
  const StartWithPhotoScreen({super.key});

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

              // 1. Title
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: const [
                    TextSpan(text: 'Start with a '),
                    TextSpan(
                      text: 'Photo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 1),

              // 2. The Visualization Card
              Center(
                child: Column(
                  children: [
                    // The Image Container
                    Container(
                      height: 250, // Slightly taller to match screenshot proportions
                      width: 250,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06), // Very subtle shadow
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // The Cup Image
                          Center(
                            child: Image.asset(
                              'assets/images/cup_example.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          // Decorative Leaf Icons (Top Right)
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(Icons.eco, color: Color(0xFF4CAF50), size: 24),
                          ),
                          // Decorative Leaf Icons (Left Center - connected to tree)
                          const Positioned(
                            left: 0,
                            top: 80,
                            child: Icon(Icons.eco, color: Color(0xFF2E7D32), size: 24),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // The Tree/Tags Structure
                    // Using a constrained width to keep alignment tight
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          _buildTagRow(context, 'Category', 'Drink', isFirst: true),
                          _buildTagRow(context, 'Object', 'Cup'),
                          _buildTagRow(context, 'Material', 'Plastic'),
                          _buildTagRow(context, 'Confidence', '98%', isLast: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              // 3. Instruction Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 24,
                  ),
                  children: [
                    const TextSpan(text: 'Find '),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2196F3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                      ),
                    ),
                    const TextSpan(text: ' on your screen\nto get started'),
                  ],
                ),
              ),

              const Spacer(flex: 1),

              // 4. Start Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigates to Login, which then goes to Dashboard
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build the "Tree" connected lines and tags
  Widget _buildTagRow(BuildContext context, String label, String value, {bool isFirst = false, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // The Tree Line Visuals column
          SizedBox(
            width: 40, // Increased width for the connection line area
            child: Column(
              children: [
                // Upper Line (connects to item above)
                Expanded(
                  child: Container(
                    width: 1, // Thin line
                    color: isFirst ? Colors.transparent : Colors.grey[300],
                    margin: const EdgeInsets.only(left: 20), // Center the line
                  ),
                ),
                // The Horizontal Connector (The "Branch")
                Row(
                  children: [
                    const SizedBox(width: 20), // Spacing to align with vertical line
                    Container(
                      width: 12, // Length of the horizontal branch
                      height: 1,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                // Lower Line (connects to item below)
                Expanded(
                  child: Container(
                    width: 1,
                    color: isLast ? Colors.transparent : Colors.grey[300],
                    margin: const EdgeInsets.only(left: 20),
                  ),
                ),
              ],
            ),
          ),

          // The Content (Label + Value Button)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  // Label (Category, Object, etc.)
                  SizedBox(
                    width: 80, // Slightly wider to accommodate "Confidence"
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Value Button (Drink, Cup, etc.)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3), // Brand Blue
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}