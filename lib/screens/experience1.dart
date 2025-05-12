import 'package:flutter/material.dart';

class Experience1 extends StatefulWidget {
  const Experience1({super.key});

  @override
  _Experience1PageState createState() => _Experience1PageState();
}

class _Experience1PageState extends State<Experience1> {
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
                    'assets/images/safari1.jpg',
                    'assets/images/safari2.jpg',
                    'assets/images/safari3.jpg',
                    'assets/images/safari4.jpg',
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
                    'Safari in Yala National Park',
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
                'Safari in Yala National Park is one of the most popular wildlife experiences in Sri Lanka. Located in the southeastern part of the island, Yala is famous for its rich biodiversity, stunning landscapes, and exceptional wildlife. The park is home to a variety of animals, including the elusive **Sri Lankan leopard**, **elephants**, and numerous bird species. Yala offers an unforgettable opportunity to see these magnificent creatures in their natural habitats.\n\n'
                'Yala National Park covers an area of about **978 square kilometers**, with diverse ecosystems such as **dry forests**, **grasslands**, **wetlands**, and **beachfronts**. This variation in terrain creates ideal habitats for a wide range of wildlife, making Yala a prime location for safaris. The park is renowned for having one of the highest densities of **Sri Lankan leopards** in the world, and it is one of the best places to spot them in the wild.\n\n'
                'In addition to leopards, Yala is home to a large population of **Sri Lankan elephants**, which can be seen roaming freely in the park. Other notable animals include **wild boars**, **crocodiles**, **water buffalo**, and a variety of **deer**. Yala is also a birdwatcher’s paradise, with over **200 species of birds**, including **eagles**, **pelicans**, and the **Sri Lankan junglefowl** (the national bird of Sri Lanka).\n\n'
                'The best time to visit Yala for a safari is during the **dry season**, which runs from **February to June**. During this period, animals are more likely to gather around the park’s water sources, making them easier to spot. Early morning and late afternoon safaris are the best times to see wildlife when the animals are most active.\n\n'
                'The safari experience at Yala usually takes place in **open-top jeeps**. Local guides, who are experts in the park’s wildlife, lead the safaris, ensuring that visitors have the best chance to spot animals while maintaining a respectful distance. During the safari, you can expect to see leopards lounging in the shade, elephants grazing peacefully, and perhaps even a crocodile basking by a waterhole.\n\n'
                'Yala National Park offers various safari packages, including **morning and afternoon safaris**. The safari can last for **3 to 4 hours**, giving visitors plenty of time to explore the park and take in the breathtaking scenery. Yala’s diverse landscapes and wildlife make it an excellent destination for nature lovers and wildlife photographers.\n\n'
                'Visitor Tips: Safaris in Yala can get very popular, especially during peak tourist seasons, so it is advisable to book in advance. Wear comfortable clothing, sturdy shoes, and bring sunscreen, a hat, and binoculars for bird watching. The weather can be hot, so be sure to bring plenty of water and stay hydrated during the safari. If you’re planning to photograph wildlife, be sure to bring a good camera with a zoom lens.\n\n'
                'Overall, a safari in Yala National Park provides an extraordinary opportunity to experience the wildlife of Sri Lanka in a natural setting. Whether you’re a wildlife enthusiast, a photographer, or just looking for an adventurous experience, Yala is an essential destination for anyone visiting Sri Lanka.',
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
