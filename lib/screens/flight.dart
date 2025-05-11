import 'package:flutter/material.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightPage> {
  DateTime selectedDate = DateTime.now();

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
                'Flight Search',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // From and To Fields
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'From',
                        labelStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.swap_horiz, size: 30, color: Colors.blue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'To',
                        labelStyle: const TextStyle(color: Colors.blue),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        suffixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Departure Date
              TextField(
                controller: TextEditingController(
                  text: "${selectedDate.toLocal()}".split(' ')[0],
                ),
                decoration: InputDecoration(
                  labelText: 'Departure',
                  labelStyle: const TextStyle(color: Colors.blue),
                  hintText: 'Select Date',
                  hintStyle: const TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: _selectDate,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Airline Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Airline',
                  labelStyle: const TextStyle(color: Colors.blue),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  suffixIcon: const Icon(
                    Icons.airplanemode_active,
                    color: Colors.blue,
                  ),
                ),
                items:
                    [
                          'Any Airline',
                          'United Airlines',
                          'Delta Airlines',
                          'American Airlines',
                        ]
                        .map(
                          (airline) => DropdownMenuItem<String>(
                            value: airline,
                            child: Text(airline),
                          ),
                        )
                        .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),

              // Search Flights Button (Centered and Font Size Adjusted)
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 167,
                      vertical: 18,
                    ),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0, // Remove the shadow
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 18), // Single-line text
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Available Flights Section
              const Text(
                'Available Flights',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Filter Buttons Row with Horizontal Scrolling
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal Scroll
                child: Row(
                  children: [
                    _buildFilterButton('Lowest Price', Icons.price_check),
                    const SizedBox(width: 8),
                    _buildFilterButton('Non-stop', Icons.directions_run),
                    const SizedBox(width: 8),
                    _buildFilterButton('Morning', Icons.wb_sunny),
                    const SizedBox(width: 8),
                    _buildFilterButton('Evening', Icons.nights_stay),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Flight Card (Card with Lines and Icons)
              Card(
                elevation: 0, // Remove shadow from card
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 228, 228, 228),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Airline logo and flight details
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo path
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'United Airlines',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'UA 234',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Flight details: Time, Duration, Departure/Arrival
                      const Row(
                        children: [
                          Text(
                            '08:45',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.airplane_ticket,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '2h 45m',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'JFK - LAX',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            '\$299',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Select Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0, // Remove shadow from card
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 228, 228, 228),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Airline logo and flight details
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo path
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'United Airlines',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'UA 234',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Flight details: Time, Duration, Departure/Arrival
                      const Row(
                        children: [
                          Text(
                            '08:45',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.airplane_ticket,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '2h 45m',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'JFK - LAX',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            '\$299',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Select Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0, // Remove shadow from card
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 228, 228, 228),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Airline logo and flight details
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo path
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'United Airlines',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'UA 234',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Flight details: Time, Duration, Departure/Arrival
                      const Row(
                        children: [
                          Text(
                            '08:45',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.airplane_ticket,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '2h 45m',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'JFK - LAX',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            '\$299',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Select Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0, // Remove shadow from card
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 228, 228, 228),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Airline logo and flight details
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo path
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'United Airlines',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'UA 234',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Flight details: Time, Duration, Departure/Arrival
                      const Row(
                        children: [
                          Text(
                            '08:45',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.airplane_ticket,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '2h 45m',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'JFK - LAX',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Spacer(),
                          Text(
                            '\$299',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 8),

                      // Select Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 140),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Select',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Date Picker for Departure
  _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
      });
    }
  }

  // Filter Button Widget with Icons
  Widget _buildFilterButton(String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0, // Remove the shadow
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
