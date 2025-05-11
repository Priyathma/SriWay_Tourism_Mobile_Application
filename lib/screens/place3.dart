import 'package:flutter/material.dart';

class Place3 extends StatefulWidget {
  const Place3({super.key});

  @override
  _PlaceDetail3PageState createState() => _PlaceDetail3PageState();
}

class _PlaceDetail3PageState extends State<Place3> {
  bool _isExpanded = false; // To handle 'See More' functionality
  int _currentIndex = 0; // To handle the current image in PageView

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
        child: Column(
          children: [
            // Image Carousel with constrained height
            SizedBox(
              height: 250, // Constrained height
              child: PageView.builder(
                itemCount: 4, // Set this to the length of your images list
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Update the current index
                  });
                },
                itemBuilder: (context, index) {
                  // List of image assets
                  List<String> images = [
                    'assets/images/kandy.jpg',
                    'assets/images/kandy1.jpg',
                    'assets/images/kandy2.jpg',
                    'assets/images/kandy3.jpg',
                    // Add more image paths
                  ];

                  return Image.asset(
                    images[index], // Use the image based on the current index
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  );
                },
              ),
            ),

            // Dot Indicators for PageView
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // Place Info
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 1),
                  Text(
                    'Kandy, Sri Lanka',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 5),
                  Text('4.8'),
                  SizedBox(width: 5),
                  Text('(2,341 reviews)', style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  Text('Open Now', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons (Directions, Share)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // Expanded widget to make buttons the same width
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.directions, color: Colors.white),
                      label: const Text(
                        'Directions',
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
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: Colors.white),
                      label: const Text(
                        'Share',
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
            const SizedBox(height: 30),

            // About Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kandy, located in the central region of Sri Lanka, is a vibrant city rich in history, culture, and natural beauty. Known as the last capital of the ancient Sri Lankan kings, it holds great historical significance and has been a major cultural and religious hub for centuries. The city is renowned for its stunning lake, lush hills, and the iconic **Temple of the Tooth** (Sri Dalada Maligawa), which draws millions of visitors annually. However, Kandy is much more than just the temple. The city is home to various cultural landmarks, beautiful gardens, and vibrant markets that showcase Sri Lanka’s diverse heritage.\n\n'
                'Kandy is surrounded by picturesque hills and offers breathtaking views, making it a popular destination for nature lovers and travelers. The Kandy Lake, located in the heart of the city, provides a peaceful atmosphere for tourists to relax and reflect. Visitors can take a serene stroll around the lake or enjoy boat rides while admiring the surrounding mountains. The city’s cool climate and greenery make it a refreshing escape from the tropical heat of coastal regions.\n\n'
                'The Kandy Esala Perahera, a grand annual procession, is one of Sri Lanka’s most famous cultural events. Held in July or August, this procession honors the Sacred Tooth Relic and features beautifully decorated elephants, traditional dancers, drummers, fire-breathers, and colorful floats. It is a chance for tourists to witness the vibrant religious and cultural traditions of Sri Lanka in their most magnificent form.\n\n'
                'In addition to the cultural heritage, Kandy is a city full of modern amenities. It offers plenty of shops, cafes, and restaurants where tourists can sample local delicacies and shop for traditional Sri Lankan crafts and souvenirs. The city also has several attractions such as the **Royal Botanical Gardens** in Peradeniya, **Kandy View Point**, and the **Cultural Complex**, where visitors can learn about the city’s rich history and culture.\n\n'
                'A visit to Kandy is not just about exploring its historical sites, but about experiencing the essence of Sri Lanka’s culture, nature, and spirituality. The city is a blend of tradition and modernity, making it one of the most cherished destinations for travelers seeking a meaningful and enriching experience. The preservation of Kandy’s heritage, natural beauty, and cultural festivals relies on tourism, which makes the city an integral part of Sri Lanka’s sustainable tourism efforts.',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 49, 49, 49),
                ),
                textAlign: TextAlign.justify,
                maxLines:
                    _isExpanded ? null : 8, // Limit the text if not expanded
                overflow:
                    _isExpanded
                        ? null
                        : TextOverflow
                            .ellipsis, // Show "See More" when truncated
              ),
            ),

            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded; // Toggle expansion
                  });
                },
                child: Text(
                  _isExpanded ? '     See Less' : '     See More',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Location Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Map Image (Replace with real map if needed)
            Image.asset('assets/images/daladamap.png', fit: BoxFit.contain),

            const SizedBox(height: 20),

            // Action Buttons (Directions, Share)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
