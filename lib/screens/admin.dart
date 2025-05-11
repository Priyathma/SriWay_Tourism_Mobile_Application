import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // Sample data list of places
  List<Map<String, String>> places = [
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
  ];

  // Form controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void _addPlace() {
    setState(() {
      places.add({
        'title': titleController.text,
        'image': imageController.text,
        'country': countryController.text,
        'rating': ratingController.text,
      });
    });

    // Clear input fields
    titleController.clear();
    countryController.clear();
    ratingController.clear();
    imageController.clear();
  }

  void _updatePlace(int index) {
    setState(() {
      places[index] = {
        'title': titleController.text,
        'image': imageController.text,
        'country': countryController.text,
        'rating': ratingController.text,
      };
    });
  }

  void _deletePlace(int index) {
    setState(() {
      places.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Form fields for adding/updating place
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: ratingController,
              decoration: const InputDecoration(labelText: 'Rating'),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image Path'),
            ),
            const SizedBox(height: 20),
            // Add Button
            ElevatedButton(
              onPressed: _addPlace,
              child: const Text('Add Place'),
            ),
            const SizedBox(height: 20),
            // Display list of places with update and delete options
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(places[index]['title']!),
                    subtitle: Text(
                      'Country: ${places[index]['country']}\nRating: ${places[index]['rating']}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            titleController.text = places[index]['title']!;
                            countryController.text = places[index]['country']!;
                            ratingController.text = places[index]['rating']!;
                            imageController.text = places[index]['image']!;
                            _updatePlace(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deletePlace(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
