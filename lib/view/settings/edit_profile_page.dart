import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// edit_profile_page.dart
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.onNameUpdated})
      : super(key: key);

  // Callback function to pass the updated name to the parent widget
  final Function(String) onNameUpdated;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user's information and populate the text controllers
    fetchUserInfo();
  }

  void fetchUserInfo() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _nameController.text = user.displayName ?? '';
      });
    }
  }

  void updateProfile() {
    // Update user's information
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.updateDisplayName(_nameController.text).then((_) {
        // Call the callback function to pass the updated name to the parent widget
        widget.onNameUpdated(_nameController.text);
      }).catchError((error) {
        // Handle error
        print('Failed to update name: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call function to update profile
                updateProfile();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
