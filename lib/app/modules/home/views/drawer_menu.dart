import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
      _saveImagePath(image.path);
    }
  }

  Future<void> _loadSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('picked_image_path');

    if (imagePath != null) {
      setState(() {
        _pickedImage = File(imagePath);
      });
    }
  }

  Future<void> _saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('picked_image_path', path);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Anisha Word',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text('anisha@example.com'),
            currentAccountPicture: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _pickedImage != null
                    ? FileImage(_pickedImage!)
                    : const AssetImage('assets/images/avatar.png') as ImageProvider,
                child: _pickedImage == null
                    ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
                    : null,
              ),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF763794), Color(0xFFB07BAF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildDrawerItem(Icons.home, 'Home'),
                _buildDrawerItem(Icons.music_note, 'Music'),
                _buildDrawerItem(Icons.settings, 'kategory'),
                _buildDrawerItem(Icons.help, 'bahasa'),
                _buildDrawerItem(Icons.help, 'settings'),
                _buildDrawerItem(Icons.help, 'help'),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1A535C)),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
    );
  }
}
