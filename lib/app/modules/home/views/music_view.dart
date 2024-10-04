import 'package:flutter/material.dart';

class MusicView extends StatelessWidget {
  final String imageUrl;

  const MusicView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with overlay
          _buildBackgroundImage(),
          // Overlay content
          _buildOverlayContent(context),
        ],
      ),
    );
  }

  // Background Image with gradient overlay
  Widget _buildBackgroundImage() {
    return SizedBox(
      height: 350, // Adjust height based on your needs
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Overlay content
  Widget _buildOverlayContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40), // Space for status bar
          _buildAppBar(context),
          const SizedBox(height: 200),
          _buildAlbumDetails(),
          _buildTopTracks(),
        ],
      ),
    );
  }

  // Custom AppBar
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
    );
  }

  // Album details section
  Widget _buildAlbumDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'The Vamps',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildAlbumCard('10 Years Of The Vamps', '14 October 2022', 'assets/images/album1.png'),
              const SizedBox(width: 16),
              _buildAlbumCard('Cherry Blossom', '18 December 2020', 'assets/images/album2.png'),
            ],
          ),
        ],
      ),
    );
  }

  // Album card
  Widget _buildAlbumCard(String title, String date, String image) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.transparent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Top tracks section
  Widget _buildTopTracks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Track',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          _buildTrackItem('Somebody To You', 'Meet The Vamps', 'assets/images/track1.png'),
          _buildTrackItem('All Night', 'Night & Day (Night Edition)', 'assets/images/track2.png'),
          _buildTrackItem('Can We Dance', 'Meet The Vamps', 'assets/images/track3.png'),
          _buildTrackItem('Somebody To You', 'Meet The Vamps (Christmas Edition)', 'assets/images/track1.png'),
          _buildTrackItem('Just My Type', 'Meet The Vamps', 'assets/images/track4.png'),
        ],
      ),
    );
  }

  // Single track item
  Widget _buildTrackItem(String title, String album, String image) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(image),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      subtitle: Text(
        album,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow, color: Colors.blueAccent, size: 28),
        onPressed: () {
          // Handle play button press
        },
      ),
    );
  }
}
