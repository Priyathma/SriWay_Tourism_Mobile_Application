import 'package:flutter/material.dart';

class Hotel2Page extends StatelessWidget {
  const Hotel2Page({super.key});

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
                '',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hotel Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/hotel2.jpg', // Replace with your image path
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 10),

              // Hotel Name, Rating, and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kottawatta River Bank Resort',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '\$299/night',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 0),
              const Text(
                ' demodaramulla, madyama adaluwa, Udawalawa',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Hotel Facilities
              const Text(
                'Facilities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.wifi, color: Colors.blue),
                  SizedBox(width: 30),
                  Icon(Icons.pool, color: Colors.blue),
                  SizedBox(width: 30),
                  Icon(Icons.liquor, color: Colors.blue),
                  SizedBox(width: 30),
                  Icon(Icons.restaurant, color: Colors.blue),
                  SizedBox(width: 30),
                  Icon(Icons.local_parking, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 25),

              // Available Rooms
              const Text(
                'Available Rooms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Room Options
              _buildRoomOption(
                'Standard Double Room',
                '2 guests 1 bed',
                '\$299',
                'assets/images/hotel21.jpg',
              ),
              _buildRoomOption(
                'Deluxe King Room',
                '2 guests 1 king bed',
                '\$399',
                'assets/images/hotel21.jpg',
              ),
              _buildRoomOption(
                'Executive Suite',
                '4 guests 2 beds',
                '\$599',
                'assets/images/hotel21.jpg',
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    // Expanded widget to make buttons the same width
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, color: Colors.white),
                        label: const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue background
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Location Section
              const Text(
                'Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/daladamap.png', // Replace with map image
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 20),

              // Book Now Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    // Expanded widget to make buttons the same width
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.directions, color: Colors.white),
                        label: const Text(
                          'Get Directions',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Blue background
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build room options
  Widget _buildRoomOption(
    String title,
    String details,
    String price,
    String imagePath,
  ) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath, // Use the provided room image
              fit: BoxFit.cover,
              height: 100,
              width: 120,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(details, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
