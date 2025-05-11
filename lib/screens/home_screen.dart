import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sriway/screens/Place1.dart';
import 'package:sriway/screens/Place2.dart';
import 'package:sriway/screens/flight.dart';
import 'package:sriway/screens/guide.dart';
import 'package:sriway/screens/hotel.dart';
import 'package:sriway/screens/map.dart';
import 'package:sriway/screens/place3.dart';
import 'package:sriway/screens/place4.dart';
import 'package:sriway/screens/places.dart';
import 'package:sriway/screens/rental.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> places = [
    {
      'title': 'Temple of Tooth',
      'image': 'assets/images/dalada.jpg',
      'country': 'City Kandy',
      'rating': '4.8',
    },
    {
      'title': 'Galle Fort',
      'image': 'assets/images/galle.jpg',
      'country': 'City Galle',
      'rating': '4.5',
    },
    {
      'title': 'Kandy',
      'image': 'assets/images/kandy.jpg',
      'country': 'City Kandy',
      'rating': '4.7',
    },
    {
      'title': 'Seegirya',
      'image': 'assets/images/seegiriya.jpg',
      'country': 'City',
      'rating': '4.6',
    },
  ];

  final List<Map<String, String>> experiences = [
    {
      'title': 'Safari in Yala',
      'image': 'assets/images/kandy.jpg',
      'description':
          'Experience the thrill of wildlife in Sri Lanka’s \n famous Yala National Park.',
    },
    {
      'title': 'Whale Watching in Mirissa',
      'image': 'assets/images/kandy.jpg',
      'description':
          'Witness the majestic whales off the coast of \n Mirissa, one of the best whale-watching spots.',
    },
    {
      'title': 'Scuba Diving in Hikkaduwa',
      'image': 'assets/images/kandy.jpg',
      'description':
          'Explore the vibrant underwater world in the \n crystal-clear waters of Hikkaduwa.',
    },
    {
      'title': 'Cultural Tour in Kandy',
      'image': 'assets/images/kandy.jpg',
      'description':
          'Discover the rich cultural heritage of \n Kandy, including the Temple of the Tooth.',
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Text(
                'SriWay',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 35,
                width: 220,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 20,
                    ),
                    hintText: 'Where to?',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ready for your next adventure?',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Destinations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the respective PlaceDetailPage based on the title
                      String title = places[index]['title']!;
                      if (title == 'Temple of Tooth') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Place1(),
                          ),
                        );
                      } else if (title == 'Galle Fort') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place2(), // Assuming Place2 is for Galle Fort
                          ),
                        );
                      } else if (title == 'Kandy') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place3(), // Assuming Place3 is for Kandy
                          ),
                        );
                      } else if (title == 'Seegirya') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place4(), // Assuming Place4 is for Seegirya
                          ),
                        );
                      }
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              places[index]['image']!,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 280,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              places[index]['title']!,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              places[index]['country']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                Text(
                                  places[index]['rating']!,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            // Using Row with SingleChildScrollView for Horizontal Scroll
            buildServiceIcons(context),
            const SizedBox(height: 25),
            CarouselSlider(
              items: [
                Image.asset('assets/images/ad2.jpeg', fit: BoxFit.fitWidth),
                Image.asset('assets/images/ad2.jpeg', fit: BoxFit.fitWidth),
                Image.asset('assets/images/ad2.jpeg', fit: BoxFit.fitWidth),
              ],
              options: CarouselOptions(
                height: 230,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1.0,
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/s2.png',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 65,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '30% OFF',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Luxury Hotels',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Book Now'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/s1.jpg',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 65,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '25% OFF',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Adventure Tours',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Book Now'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended Experiences',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the respective PlaceDetailPage based on the title
                      String title = places[index]['title']!;
                      if (title == 'Temple of Tooth') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Place1(),
                          ),
                        );
                      } else if (title == 'Galle Fort') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place2(), // Assuming Place2 is for Galle Fort
                          ),
                        );
                      } else if (title == 'Kandy') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place3(), // Assuming Place3 is for Kandy
                          ),
                        );
                      } else if (title == 'Seegirya') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const Place4(), // Assuming Place4 is for Seegirya
                          ),
                        );
                      }
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              places[index]['image']!,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 280,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              places[index]['title']!,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              places[index]['country']!,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                Text(
                                  places[index]['rating']!,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildServiceIcons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Horizontal scroll
        child: Row(
          children: [
            serviceIcon(
              context,
              Icons.location_on,
              'Places',
              Colors.blue,
              const Places(),
            ),
            serviceIcon(
              context,
              Icons.hotel,
              'Hotels',
              Colors.blue,
              const HotelsPage(),
            ),
            serviceIcon(
              context,
              Icons.flight_takeoff,
              'Flights',
              Colors.blue,
              const FlightPage(),
            ),
            serviceIcon(
              context,
              Icons.car_rental,
              'Rentals',
              Colors.blue,
              const RentalPage(),
            ),
            serviceIcon(
              context,
              Icons.person,
              'Guides',
              Colors.blue,
              const Guide(),
            ),
            serviceIcon(
              context,
              Icons.map,
              'Map',
              Colors.blue,
              const MapPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceIcon(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: color, size: 35),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
