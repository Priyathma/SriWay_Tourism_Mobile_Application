import 'package:flutter/material.dart';

class Place4 extends StatefulWidget {
  const Place4({super.key});

  @override
  _PlaceDetail4PageState createState() => _PlaceDetail4PageState();
}

class _PlaceDetail4PageState extends State<Place4> {
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
                    'assets/images/Sigiriya1.jpg',
                    'assets/images/Sigiriya2.jpg',
                    'assets/images/Sigiriya3.jpg',
                    'assets/images/Sigiriya4.jpeg',
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
                    'Sigiriya, Sri Lanka',
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
                'Sigiriya, often referred to as the Lion’s Rock, is one of Sri Lanka’s most iconic and historically significant landmarks. Located in the central Matale District, it is a massive rock fortress that rises about 200 meters (660 feet) above the surrounding plains. Sigiriya is a UNESCO World Heritage site, famous for its breathtaking views, ancient ruins, and the rich history embedded in its walls. The fortress was built by King Kasyapa I in the 5th century AD and served as his royal capital. According to legend, the king, who usurped the throne from his father, built the fortress as a safe haven and stronghold to protect himself from his enemies. The rock was chosen because of its strategic location and sheer height, making it almost impregnable. The site is an impressive combination of palaces, gardens, water features, and fortifications, all designed with great precision.\n\n'
                'One of the most striking features of Sigiriya is its Lion’s Gate, which once had a giant lions head sculpture, giving the rock its name. Visitors still ascend the rock via a staircase that passes through the remnants of the lion’s paws, symbolizing the entry to the king’s private realm. The Mirror Wall is another fascinating aspect of the site; it was originally so polished that the king could see his reflection in it, and today, visitors can still see ancient graffiti left by travelers over the centuries.\n\n'
                'The Sigiriya frescoes are another highlight, featuring vibrant, ancient paintings of naked women, believed to be apsaras (celestial nymphs). These paintings, along with the gardens and water fountains, showcase the advanced engineering and artistic skills of the ancient Sri Lankans. The frescoes are a testament to the vibrant artistic culture of the period and add a layer of cultural depth to the site.\n\n'
                'In addition to the rock fortress, the surrounding Sigiriya archaeological site includes the royal gardens, which are among the oldest landscaped gardens in the world. The gardens, including the water gardens, terraces, and pools, reflect the highly sophisticated engineering and planning techniques of the ancient civilization.\n\n'
                'Sigiriya is not only a place of historical and architectural significance but also a cultural symbol of Sri Lanka’s heritage. Its history, combined with its stunning natural beauty, makes it one of the top tourist destinations in Sri Lanka. Visitors come to explore the ruins, marvel at the views, and gain a deeper understanding of the country’s ancient history.\n\n'
                'Visiting Sigiriya is a journey back in time, offering insights into the history, culture, and engineering genius of ancient Sri Lanka. Whether you are a history enthusiast, an art lover, or simply someone looking to experience one of the most beautiful places in the world, Sigiriya should be at the top of your list when traveling through Sri Lanka.',
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
