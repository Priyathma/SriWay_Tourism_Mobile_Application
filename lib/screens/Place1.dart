import 'package:flutter/material.dart';

class Place1 extends StatefulWidget {
  const Place1({super.key});

  @override
  _PlaceDetail1PageState createState() => _PlaceDetail1PageState();
}

class _PlaceDetail1PageState extends State<Place1> {
  bool _isExpanded = false; // To handle 'See More' functionality
  int _currentIndex = 0; // For tracking the current index in the PageView

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
                    'assets/images/dalada.jpg',
                    'assets/images/dalada2.jpg', // Add more image paths here
                    'assets/images/dalada3.jpg',
                    'assets/images/dalada4.jpg',
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
                    'Temple of the Tooth Relic, Kandy',
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
                'The Temple of the Tooth (Sri Dalada Maligawa) in Kandy, Sri Lanka, is one of the most significant religious, cultural, and historical sites in the country. Revered by Buddhists around the world, it houses the Sacred Tooth Relic of Buddha, an essential symbol of Buddhism and royal power for centuries. The temple’s rich history dates back to the 16th century and over time, it has become a cultural landmark in Sri Lanka.\n\n'
                'The temple’s architecture is an exquisite example of Kandyan-style design, with intricate carvings, grand pillars, and sacred spaces that enhance its spiritual allure. The inner sanctum, where the tooth relic is stored, is closely guarded and holds deep meaning for Buddhists. This site is considered a key pilgrimage destination for devotees.\n\n'
                'The Kandy Esala Perahera, an annual procession held in honor of the sacred relic, is one of Sri Lanka’s most spectacular cultural events. Featuring parades of decorated elephants, dancers, drummers, and fire-breathers, this event attracts thousands of visitors and showcases Sri Lankan religious traditions in their most colorful form.\n\n'
                'A visit to the Temple of the Tooth is not only about admiring its architectural beauty but also connecting with Sri Lanka’s spiritual heritage. Visitors can delve into the island’s royal history and experience the serene surroundings and breathtaking views of Kandy Lake, making it a perfect destination for reflection and tranquility. The continued preservation of this temple relies on income from tourism, making it an integral part of Sri Lanka’s cultural sustainability.\n\n'
                'Visitor Tips: The temple is open daily from [time] to [time], with an entry fee of [price]. It’s recommended to visit during the early morning or late afternoon to avoid crowds. Remember to dress modestly as it is a religious site. Be respectful of the rituals and ceremonies being conducted.\n\n'
                'Overall, the Temple of the Tooth offers visitors not only a glimpse into Sri Lanka’s rich spiritual and cultural heritage but also an experience of peace and reflection at the heart of Kandy’s stunning landscape.',
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
