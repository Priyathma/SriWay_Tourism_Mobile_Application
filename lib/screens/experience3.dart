import 'package:flutter/material.dart';

class Experience3 extends StatefulWidget {
  const Experience3({super.key});

  @override
  _Experience3PageState createState() => _Experience3PageState();
}

class _Experience3PageState extends State<Experience3> {
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
                    'assets/images/scuba1.jpg',
                    'assets/images/scuba2.jpg',
                    'assets/images/scuba3.jpg',
                    'assets/images/scuba4.jpg',
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
                    'Scuba Diving in Hikkaduwa',
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
                'Scuba Diving in Hikkaduwa is one of the most popular underwater adventures in Sri Lanka. Located on the southwestern coast of the island, Hikkaduwa is renowned for its **vibrant coral reefs**, **clear waters**, and diverse marine life, making it a perfect destination for diving enthusiasts. Whether you are a beginner or an experienced diver, Hikkaduwa offers an exciting and unforgettable diving experience.\n\n'
                'Hikkaduwa’s dive sites are home to an incredible variety of **marine life**, including **sea turtles**, **tropical fish**, **moray eels**, and **rays**. The waters around Hikkaduwa are rich in marine biodiversity, with beautiful coral gardens and vibrant underwater landscapes. The coral reefs in this area are some of the most well-preserved in Sri Lanka, providing a colorful and dynamic environment for divers to explore.\n\n'
                'The best time to go scuba diving in Hikkaduwa is during the **dry season**, from **November to April**, when the sea conditions are calm, and visibility is at its peak. The water temperature is ideal, ranging from **27°C to 29°C (80°F to 84°F)**, offering a comfortable environment for diving.\n\n'
                'Some of the top dive sites in Hikkaduwa include:\n'
                '- **Hikkaduwa Coral Gardens**: Known for its vibrant coral reefs and abundance of fish species. Perfect for both beginners and experienced divers.\n'
                '- **Nylon Reef**: A deeper dive site where divers can spot **large schools of fish**, **sea turtles**, and even **reef sharks**.\n'
                '- **The Wreck of the Conch**: A popular wreck dive site, where you can explore a sunken ship that has become a habitat for various marine species.\n'
                'These dive sites offer opportunities for divers of all levels to experience the beauty of Hikkaduwa’s marine world.\n\n'
                'In addition to scuba diving, **snorkeling** is another great way to explore the waters of Hikkaduwa. The shallow reefs are perfect for snorkeling, allowing visitors to observe the underwater life from the surface. **Scuba diving** provides a deeper and more immersive experience, where you can explore the vibrant coral gardens and get up close with the marine life.\n\n'
                'Visitor Tips: When scuba diving in Hikkaduwa, it’s recommended to book your dive trips in advance, especially during peak seasons. Wear comfortable clothing, a hat, and sunscreen, as you’ll likely spend time on the boat before and after your dive. Bring a **camera** to capture the stunning underwater scenery and **binoculars** for potential sightings of dolphins or larger fish species. If you’re prone to seasickness, taking **motion sickness medication** before your trip is advisable. Don’t forget to stay hydrated throughout the day.\n\n'
                'Overall, scuba diving in Hikkaduwa offers an incredible opportunity to explore Sri Lanka’s vibrant underwater world. With its beautiful coral reefs, rich marine life, and ideal diving conditions, Hikkaduwa is an essential destination for any diving enthusiast visiting Sri Lanka.',
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
