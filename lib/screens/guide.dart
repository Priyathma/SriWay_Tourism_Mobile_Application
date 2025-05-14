import 'package:flutter/material.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<Guide> {
  String selectedFilter = 'All Locations';

  final List<Map<String, String>> guides = [
    {
      'name': 'S. SUDHARSHANA DISSANAYAKE',
      'location': 'No, 80/1 pepiliyana road, nedimala dehiwala.',
      'rating': '4.8',
      'reviews': '124',
      'price': '\$50/tour',
      'image': 'assets/images/g1.jpg', // Replace with correct image
    },
    {
      'name': 'M.A. ATHULA CHANDRADASA',
      'location': '122/1, dutugemunu street, kalubowila, dehiwala.',
      'rating': '4.7',
      'reviews': '215',
      'price': '\$55/tour',
      'image': 'assets/images/g2.jpg', // Replace with correct image
    },
    {
      'name': 'W.VASANTHA PERERA',
      'location': 'No.7,garamasanwardena road,boralesgamuwa',
      'rating': '4.9',
      'reviews': '130',
      'price': '\$60/tour',
      'image': 'assets/images/g3.jpg', // Replace with correct image
    },
    {
      'name': 'K.A.S. KUMARA KURUPPU',
      'location': 'No. 211/391, walawwatta, welipillewa, ganemulla',
      'rating': '4.6',
      'reviews': '95',
      'price': '\$45/tour',
      'image': 'assets/images/g4.jpg', // Replace with correct image
    },
    // Add more guides here
  ];

  // Guide Card Widget
  Widget _buildGuideCard(
    String name,
    String location,
    String rating,
    String reviews,
    String price,
    String imagePath,
  ) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          // Guide Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 5),
          // Guide Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(location, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating ($reviews)',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // Book Now Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 8),
            ),
            child: const Text('Book Now', style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Filter Button Widget with Location Filter
  Widget _buildFilterButton(String label) {
    bool isSelected = label == selectedFilter;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFilter = label; // Update selected filter
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0, // No shadow
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Text(
                'Tour Guides',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Wrapping entire body in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar (similar to home page)
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search guides',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ), // Set focused border color to blue
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Filter Buttons (Horizontal Scroll)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton("All Locations"),
                    const SizedBox(width: 8),
                    _buildFilterButton("Kandy"),
                    const SizedBox(width: 8),
                    _buildFilterButton("Galle"),
                    const SizedBox(width: 8),
                    _buildFilterButton("Colombo"),
                    const SizedBox(width: 8),
                    _buildFilterButton("Sigiriya"),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Guide Listings with 2 guides per row (Grid)
              GridView.builder(
                shrinkWrap: true, // Makes GridView not take full height
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 guides per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.64, // Adjust for better layout
                ),
                itemCount: guides.length,
                itemBuilder: (context, index) {
                  return _buildGuideCard(
                    guides[index]['name']!,
                    guides[index]['location']!,
                    guides[index]['rating']!,
                    guides[index]['reviews']!,
                    guides[index]['price']!,
                    guides[index]['image']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
