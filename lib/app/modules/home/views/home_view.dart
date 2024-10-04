import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/profile_controller.dart';
//import 'profile_view.dart';
import 'drawer_menu.dart';
import 'music_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'playerview.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light background color
      appBar: _buildAppBar(),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(),
            _buildSearchBar(),
            _buildTrendingMusicSection(),
            _buildTabSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        'Musicku',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
           // Get.to(() => const ProfileView());
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _buildGreetingSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hello word',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'What do you want to hear today?',
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search your favorite',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: const Icon(Icons.search, color: Colors.black54),
          suffixIcon: const Icon(Icons.tune, color: Colors.black54),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }

  Widget _buildTrendingMusicSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Music Trending',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Show more',
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildImageBox('assets/images/music1.jpg'),
                const SizedBox(width: 16),
                _buildImageBox('assets/images/music2.jpg'),
                const SizedBox(width: 16),
                _buildImageBox('assets/images/music3.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection() {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Recently'),
              Tab(text: 'Popular'),
              Tab(text: 'Similar'),
              Tab(text: 'Trending'),
            ],
            isScrollable: false,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.blueAccent,
          ),
          const SizedBox(height: 16),
          // Wrap the TabBarView with SizedBox and adjust height to prevent overflow
          SizedBox(
            height: 350, // Adjust height to prevent overflow
            child: TabBarView(
              children: [
                _buildSongList(),
                _buildSongList(),
                _buildSongList(),
                _buildSongList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSongItem(
              'assets/images/50x50.png', 'Rockabye', 'Sean Paul & Anne-Marie',
              '2:45 / 4:56'),
          _buildSongItem(
              'assets/images/50x50.png', 'Bet You Think About Me', 'Taylor Swift',
              '2:45 / 4:56'),
          _buildSongItem(
              'assets/images/50x50.png', 'Love Again', 'Dua Lipa', '2:45 / 4:56'),
        ],
      ),
    );
  }

  Widget _buildSongItem(String imageUrl, String title, String artist, String duration) {
    return GestureDetector(
      onTap: () {
        // Navigate to the PlayerView screen with song details
        Get.to(() => PlayerView(title: title, artist: artist, imageUrl: imageUrl));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artist,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.blueAccent,
                    size: 28,
                  ),
                  onPressed: () {
                    // Add action to play music
                  },
                ),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildImageBox(String imageUrl) {
    return GestureDetector(
      onTap: () {
        // Navigate to the MusicView screen with the appropriate details
        Get.to(() => MusicView(imageUrl: imageUrl));
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
