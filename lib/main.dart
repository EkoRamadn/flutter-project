import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Fungsi untuk mengubah halaman berdasarkan pilihan dari BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Menggunakan jumpToPage untuk menghilangkan animasi geser
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation without Swipe Animation'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Menangani tap pada bottom navigation
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.search, 1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.account_circle, 2),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membangun ikon dengan latar belakang abu-abu saat aktif
  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is the Home page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is the Search page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is the Profile page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
