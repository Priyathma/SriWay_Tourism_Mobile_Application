import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                'Profile',
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
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture and Name
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/300', // Replace with user's profile image
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.blue),
                        onPressed: () {
                          // Add function to change the profile picture
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Name and Email
              Center(
                child: Text(
                  'Alex Mitchell',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'alex.mitchell@email.com',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 5),

              // Location
              const Center(
                child: Text(
                  'San Francisco, CA',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              // Personal Details Form (Non-editable)
              _buildTextField('Full Name', 'Alex Mitchell', Icons.person),
              _buildTextField('Email', 'alex.mitchell@email.com', Icons.email),
              _buildTextField('Passport No', 'AB1234567', Icons.credit_card),
              _buildTextField('Mobile No', '+1 234 567 890', Icons.phone),
              _buildTextField('Country', 'United States', Icons.location_on),

              const SizedBox(height: 30),

              // Settings Section
              const Text(
                'Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              _buildSettingOption('Help Center', Icons.help_outline),
              _buildSettingOption('Terms & Privacy', Icons.description),
              const SizedBox(height: 10),
              _buildLogoutButton(), // Updated logout button
            ],
          ),
        ),
      ),
    );
  }

  // Method to create reusable non-editable text fields with premium design
  Widget _buildTextField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        readOnly: true, // Makes the field non-editable
        style: const TextStyle(color: Colors.black), // Black text
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black), // Black label text
          filled: true,
          fillColor: const Color.fromARGB(
            255,
            255,
            255,
            255,
          ), // Gray background for text field
          prefixIcon: Icon(icon, color: Colors.blue), // Add an icon to the left
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.5,
            ), // Blue border
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ), // Focused border
          ),
        ),
      ),
    );
  }

  // Method to create reusable settings options
  Widget _buildSettingOption(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.blue),
        title: Text(label, style: const TextStyle(color: Colors.black)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle setting navigation
        },
      ),
    );
  }

  // Method to create the logout button with icon and red color, like in the image
  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0), // Adjusted to reduce space
      child: Row(
        children: [
          Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ), // Left aligned logout icon
          const SizedBox(width: 18),
          Text(
            'Log Out',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
