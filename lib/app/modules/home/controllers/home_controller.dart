import 'package:get/get.dart';

class HomeController extends GetxController {
  // Simulasi data, kamu bisa menggantinya dengan data dari API
  var trendingMusic = [
    {'title': 'Rockabye', 'artist': 'Sean Paul & Anne-Marie'},
    {'title': 'Bet You Think About Me', 'artist': 'Taylor Swift'},
    {'title': 'Love Again', 'artist': 'Dua Lipa'}
  ].obs;

  var selectedTab = 0.obs; // Mengatur tab yang aktif

  void changeTab(int index) {
    selectedTab.value = index;
  }
}
