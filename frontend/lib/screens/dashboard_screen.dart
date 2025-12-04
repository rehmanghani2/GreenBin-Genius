import 'package:flutter/material.dart';

// Placeholder for the Camera Screen
class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: const Center(child: Text("Camera View Opening...")),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2; // Default to "Impact" (index 2)

  // List of placeholder pages for the other tabs
  final List<Widget> _pages = [
    const Center(child: Text("Activity Page")),
    const Center(child: Text("Challenges Page")),
    const ImpactTab(), // We will build this custom tab below
    const Center(child: Text("Leaderboard Page")),
    const Center(child: Text("Tasks Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // The body changes based on the selected tab
      body: _pages[_selectedIndex],

      // The Camera Button (Floating Action Button)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
        backgroundColor: const Color(0xFF2196F3), // Brand Blue
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),

      // The Bottom Navigation Bar with 5 items
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Needed for 4+ items
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart_outlined),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Impact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }
}

// This is the content of the "Impact" tab matching your screenshots
class ImpactTab extends StatelessWidget {
  const ImpactTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Blue Header Section with Custom Curve
          ClipPath(
            clipper: HeaderCurveClipper(),
            child: Container(
              height: 380, // Increased height to match screenshot
              width: double.infinity,
              color: const Color(0xFF2196F3),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Profile/Globe Button (Top Left)
                          GestureDetector(
                            onTap: () {
                              // Profile Action
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.cyanAccent, Colors.blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.public, color: Colors.white),
                            ),
                          ),
                          // Title
                          const Text(
                            "Impact",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 40), // Balance the row
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Stats
                      const Text(
                        "Total Global Litter Pickup",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "24,291,206",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 56, // Larger font size
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1.0,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Overall Pickup For November, 2025",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "85,450",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 56, // Larger font size
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 2. Bar Chart Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar("APR", 60, false),
                _buildBar("MAY", 80, false),
                _buildBar("JUN", 40, false),
                _buildBar("JUL", 70, false),
                _buildBar("AUG", 50, false),
                _buildBar("SEP", 65, false),
                _buildBar("OCT", 45, false),
                _buildBar("NOV", 55, true), // Active Month
              ],
            ),
          ),

          const SizedBox(height: 40),

          // 3. Activity Section (Responsive Title)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity, // Ensures container takes full width
              child: FittedBox(
                fit: BoxFit.scaleDown, // Scales down text if needed
                alignment: Alignment.centerLeft, // Aligns to start
                child: Row(
                  children: [
                    const Text(
                      "My ",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      "Activity ",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "This Week",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.info, color: Colors.blue[500], size: 28),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Date Circles
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildDateCircle("11/27"),
                _buildDateCircle("11/28"),
                _buildDateCircle("11/29"),
                _buildDateCircle("11/30"),
                _buildDateCircle("12/1"),
                _buildDateCircle("12/2"),
                _buildDateCircle("12/3", isActive: true),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // 4. Stories of Impact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Stories of\nImpact",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(color: Colors.pink[400], fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Stories List
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildStoryCard(
                  "Litter Data Helps San Francisco Win Court Case",
                  "https://picsum.photos/300/200?random=10",
                ),
                _buildStoryCard(
                  "How Lodi brought together its local businesses",
                  "https://picsum.photos/300/200?random=11",
                ),
              ],
            ),
          ),
          const SizedBox(height: 100), // Bottom padding for FAB
        ],
      ),
    );
  }

  // Helper for Bar Chart
  Widget _buildBar(String label, double height, bool isActive) {
    return Column(
      children: [
        Container(
          width: 8,
          height: height,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2196F3) : Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Helper for Date Circles
  Widget _buildDateCircle(String date, {bool isActive = false}) {
    return Container(
      width: 54,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2196F3) : Colors.grey[400],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          date,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Helper for Story Card
  Widget _buildStoryCard(String title, String imageUrl) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 1.2,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for the Background Curve
class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.85); // Start slightly above the bottom-left corner

    // Create a smooth wave:
    // 1. Dip down slightly
    // 2. Curve up towards the right
    path.quadraticBezierTo(
      size.width * 0.25, size.height, // Control point (bottom left area)
      size.width * 0.6, size.height * 0.85, // First curve end point
    );

    path.quadraticBezierTo(
      size.width * 0.85, size.height * 0.75, // Control point for second curve
      size.width, size.height * 0.6, // End point (higher up on the right side)
    );

    path.lineTo(size.width, 0); // Line to top right
    path.lineTo(0, 0); // Line to top left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}