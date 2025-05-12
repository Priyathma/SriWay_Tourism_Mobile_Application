import 'package:flutter/material.dart';
import 'package:sriway/screens/Place1.dart';
import 'package:sriway/screens/Place2.dart';
import 'package:sriway/screens/place3.dart';

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<Places> {
  String selectedFilter = '';
  void _navigateToDetails(String title) {
    if (title == 'Temple of Tooth') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Place1()),
      );
    } else if (title == 'Galle Fort') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Place2()),
      );
    } else if (title == 'Kandy') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Place3()),
      );
    }
  }

  // Vehicle Card Widget (same style as Hotel Cards)
  Widget _buildVehicleCard(
    String name,
    String location,
    String rating,
    String reviews,
    String imagePath,
  ) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
              height: 150,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 5),
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
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _navigateToDetails(name),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 8),
            ),
            child: const Text('See more', style: TextStyle(fontSize: 14)),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Filter Button Widget with Icons
  Widget _buildFilterButton(String label, IconData icon) {
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
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.black),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
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
                'Featured Destinations',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar (same as home page)
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Places',
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

            // Filter Buttons with Icons (Horizontal Scroll)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton(
                    "Cultural",
                    Icons.history,
                  ), // History icon for Cultural
                  const SizedBox(width: 8),
                  _buildFilterButton(
                    "Ancient",
                    Icons.account_balance,
                  ), // Account balance for Ancient (representing old buildings/ruins)
                  const SizedBox(width: 8),
                  _buildFilterButton(
                    "Religious",
                    Icons.brightness_7,
                  ), // Temple can be a symbol of religion, so a "paid" icon might work, but you could also use `Icons.church`
                  const SizedBox(width: 8),
                  _buildFilterButton(
                    "Sea",
                    Icons.beach_access,
                  ), // Beach Access icon for Sea
                  const SizedBox(width: 8),
                  _buildFilterButton(
                    "Waterfall",
                    Icons.water_drop,
                  ), // Water Drop icon for Waterfall
                  const SizedBox(width: 8),
                  _buildFilterButton(
                    "Mountains",
                    Icons.landscape,
                  ), // Landscape icon for Mountains
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Vehicle Listings (No Horizontal Scroll)
            Expanded(
              child: ListView(
                children: [
                  _buildVehicleCard(
                    'Temple of Tooth',
                    'City Kandy, Sri Lanka',
                    '4.8',
                    '2134 reviews',
                    'assets/images/dalada.jpg', // Replace with your image
                  ),
                  _buildVehicleCard(
                    'Galle Fort',
                    'City Galle, Sri Lanka',
                    '4.6',
                    '1856 reviews',
                    'assets/images/galle.jpg', // Replace with your image
                  ),
                  _buildVehicleCard(
                    'Kandy',
                    'City Kandy, Sri Lanka',
                    '5.0',
                    '500 reviews',
                    'assets/images/kandy.jpg', // Replace with your image
                  ),
                  // More vehicles can be added here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
