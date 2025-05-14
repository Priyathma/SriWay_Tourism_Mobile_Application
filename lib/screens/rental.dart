import 'package:flutter/material.dart';

class RentalPage extends StatefulWidget {
  const RentalPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleRentalPageState createState() => _VehicleRentalPageState();
}

class _VehicleRentalPageState extends State<RentalPage> {
  String selectedFilter = '';

  // Vehicle Card Widget (same style as Hotel Cards)
  Widget _buildVehicleCard(
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
          // Vehicle Image
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
          // Vehicle Info
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
          // Rent Now Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 8),
            ),
            child: const Text('Rent Now', style: TextStyle(fontSize: 14)),
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
                'Vehicle Rentals',
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
                hintText: 'Search vehicles',
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
                  _buildFilterButton("Economy", Icons.directions_car),
                  const SizedBox(width: 8),
                  _buildFilterButton("Luxury", Icons.directions_car),
                  const SizedBox(width: 8),
                  _buildFilterButton("SUV", Icons.directions_car),
                  const SizedBox(width: 8),
                  _buildFilterButton("Sports", Icons.directions_car),
                  const SizedBox(width: 8),
                  _buildFilterButton("\$50-\$200", Icons.attach_money),
                  const SizedBox(width: 8),
                  _buildFilterButton("\$200-\$500", Icons.attach_money),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Vehicle Listings (No Horizontal Scroll)
            Expanded(
              child: ListView(
                children: [
                  _buildVehicleCard(
                    'Toyota Axio',
                    'Ella',
                    '4.8',
                    '2134 reviews',
                    '\$299/day',
                    'assets/images/car1.jpg', // Replace with your image
                  ),
                  _buildVehicleCard(
                    'BMW X5',
                    'Rathnapura',
                    '4.6',
                    '1856 reviews',
                    '\$450/day',
                    'assets/images/car2.jpg', // Replace with your image
                  ),
                  _buildVehicleCard(
                    'Tesla Model S',
                    'Colombo',
                    '5.0',
                    '500 reviews',
                    '\$800/day',
                    'assets/images/car3.jpg', // Replace with your image
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
