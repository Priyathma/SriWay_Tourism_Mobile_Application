import 'package:flutter/material.dart';

class Experience4 extends StatefulWidget {
  const Experience4({super.key});

  @override
  _Experience4PageState createState() => _Experience4PageState();
}

class _Experience4PageState extends State<Experience4> {
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
                itemCount: 3, // Set this to the length of your images list
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Update the current index
                  });
                },
                itemBuilder: (context, index) {
                  // List of image assets
                  List<String> images = [
                    'assets/images/ctk1.jpg',
                    'assets/images/ctk2.jpg',
                    'assets/images/ctk3.jpg',
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
                children: List.generate(3, (index) {
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
                    'Cultural Tour in Kandy',
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
                'A Cultural Tour in Kandy offers an immersive experience into Sri Lanka’s rich heritage, historical landmarks, and spiritual traditions. Located in the central part of the island, Kandy is Sri Lanka’s cultural capital and was the last capital of the ancient kings of Sri Lanka. This UNESCO World Heritage city is home to some of the most iconic sites in the country, from ancient temples to botanical gardens, making it a must-visit destination for travelers interested in the history and culture of Sri Lanka.\n\n'
                'The Temple of the Tooth (Sri Dalada Maligawa) is the highlight of Kandy’s cultural attractions. This sacred temple houses the relic of the tooth of the Buddha, one of the most revered relics in Sri Lanka. The temple’s history dates back to the 16th century, and it has played a central role in the country’s religious and political life. Visiting the temple gives visitors a chance to witness the rituals and ceremonies associated with this sacred relic and learn about its significance in Sri Lankan Buddhism.\n\n'
                'Another important stop on a cultural tour in Kandy is the Royal Palace Complex, which once served as the home of Sri Lanka’s last monarchs. The palace is a testament to the grandeur and architectural brilliance of the Kandyan Kingdom. Nearby, you can explore the Kandy National Museum, which houses historical artifacts, royal regalia, and ancient artworks that showcase the kingdom’s cultural heritage.\n\n'
                'The Kandy Esala Perahera, held annually in July or August, is one of Sri Lanka’s most spectacular cultural events. The procession, which honors the Sacred Tooth Relic, features decorated elephants, traditional dancers, drummers, and fire-breathers. The Kandy Esala Perahera is a grand display of Sri Lankan tradition and a visual feast for those who visit during the festival period.\n\n'
                'For nature lovers and those interested in the flora of the region, the Royal Botanical Gardens in Peradeniya is a must-visit. Located just outside the city, the gardens are home to an impressive collection of tropical plants, including orchids, palm trees, and herb gardens. The gardens offer a peaceful escape from the hustle and bustle of the city, with scenic walking paths and well-maintained grounds.\n\n'
                'A cultural tour in Kandy also provides the opportunity to explore the city’s local markets, where you can purchase traditional crafts, batik textiles, and wooden carvings. The markets are an excellent place to witness the daily life of the locals and to buy unique souvenirs.\n\n'
                'Visitor Tips: Kandy is a hill city, so it’s recommended to wear comfortable walking shoes as you explore its temples, gardens, and markets. Be respectful of the religious sites by dressing modestly (shoulders and knees covered) and removing shoes when entering temples. If you visit during the Kandy Esala Perahera, be prepared for large crowds, but it’s an experience not to be missed.\n\n'
                'Overall, a Cultural Tour in Kandy offers a rich and rewarding experience that provides deep insights into the history, culture, and spirituality of Sri Lanka. With its ancient temples, royal palaces, cultural festivals, and lush gardens, Kandy is a city that will captivate you with its beauty and historical significance.',
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
