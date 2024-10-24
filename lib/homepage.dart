import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center( // Center the entire column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [

              Image.asset("assets/images/cat.jpg",width: 100, height: 100,),

              // Profile Information
              buildProfileInfo(),

              // Buttons for different sections
              buildSectionButton(context, 'Personal Info', [
                'Name: Nusura Nur',
                'Phone: 01716254821',
                'Email: nusuranurgmail@gmail.com',
                'Age: 23',
                'Address: Agrabad, Chittagong',
              ]),
              buildSectionButton(context, 'Skills', [
                'Managing Director',
                'Art',
                'Design',
              ]),
              buildSectionButton(context, 'Education', [
                'School: ABB',
                'College: BMS',
                'University: IIUC',
              ]),
              buildSectionButton(context, 'Experience', [
                'NFT Art',
                'Handling Group Work',
                'Project Management',
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create profile info
  Widget buildProfileInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Add your image here
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(''), // Update with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Profile details
        const Text(
          'My CV',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Method to create buttons for sections
  Widget buildSectionButton(BuildContext context, String title, List<String> details) {
    return ElevatedButton(
      onPressed: () {
        // Show the details in a dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: details.map((detail) => Text(detail)).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18)),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: Colors.pinkAccent, // Change button color for visibility
        foregroundColor: Colors.black, // Change button text color to black
      ),
    );
  }
}
