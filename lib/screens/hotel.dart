// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Import geocoding package

class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

  @override
  _HotelsPageState createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  String userLocation = "Getting your location...";
  String selectedFilter = '';
  bool _isLoading = true; // Start in loading state

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  // Function to get user's current location and reverse geocode it to city name
  Future<void> _getUserLocation() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        userLocation = 'Location services are disabled.';
        _isLoading = false;
      });
      return;
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          userLocation = 'Location permissions are denied.';
          _isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the case where the user permanently denies location permission
      setState(() {
        userLocation =
            'Location permissions are permanently denied. Please enable them in settings.';
        _isLoading = false;
      });
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Reverse geocode the latitude and longitude into a city name using geocoding package
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Check if we received valid data and set the city name
      if (placemarks.isNotEmpty) {
        Placemark place =
            placemarks.first; // Get the first placemark (most relevant)
        setState(() {
          userLocation =
              place.locality ?? 'City not found'; // Use locality (city) name
          _isLoading = false; // Stop loading
        });
      } else {
        setState(() {
          userLocation = 'Could not determine city';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        userLocation = 'Error fetching location data';
        _isLoading = false;
      });
    }
  }

  // Hotel Card Widget (Home Page Card Style)
  Widget _buildHotelCard(
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
          // Hotel Image
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
          // Hotel Info
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
          // Book Now Button
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
            child: const Text('Book Now', style: TextStyle(fontSize: 14)),
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
                'Find Your Stay',
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
            // Location Display (with location pin icon)
            Row(
              children: [
                const Icon(Icons.location_pin, color: Colors.blue, size: 24),
                const SizedBox(width: 8),
                _isLoading
                    ? const Text(
                      "Fetching location...",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ) // Custom loading message
                    : Text(
                      userLocation,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
              ],
            ),
            const SizedBox(height: 16),

            // Search Bar (same as home page)
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search hotels',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Filter Buttons with Icons (Horizontal Scroll Removed)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Now Horizontal Scrollable
              child: Row(
                children: [
                  _buildFilterButton("50-200", Icons.attach_money),
                  const SizedBox(width: 8),
                  _buildFilterButton("200-500", Icons.attach_money),
                  const SizedBox(width: 8),
                  _buildFilterButton("5 Star", Icons.star),
                  const SizedBox(width: 8),
                  _buildFilterButton("4 Star", Icons.star),
                  const SizedBox(width: 8),
                  _buildFilterButton("3 Star", Icons.star_half),
                  const SizedBox(width: 8),
                  _buildFilterButton("2 Star", Icons.star_border),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Hotel Listings (No Horizontal Scroll)
            Expanded(
              child: ListView(
                children: [
                  _buildHotelCard(
                    'Grand Plaza Hotel',
                    'Manhattan, New York',
                    '4.8',
                    '2134 reviews',
                    '\$299',
                    'assets/images/g.jpeg', // Replace with correct image
                  ),
                  _buildHotelCard(
                    'Riverside Luxury Inn',
                    'Brooklyn, New York',
                    '4.6',
                    '1856 reviews',
                    '\$249',
                    'assets/images/g.jpeg', // Replace with correct image
                  ),
                  _buildHotelCard(
                    'Riverside Luxury Inn',
                    'Brooklyn, New York',
                    '4.6',
                    '1856 reviews',
                    '\$249',
                    'assets/images/g.jpeg', // Replace with correct image
                  ),
                  // More hotels can be added here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
