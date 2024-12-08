import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0; // Mulai dengan opacity penuh (tidak transparan)

  @override
  void initState() {
    super.initState();

    // Menunda animasi fade out selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0; // Mengubah opacity menjadi 0 (transparan)
      });
    });

    // Setelah fade selesai (4 detik total), pindah ke halaman utama
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Latar belakang SplashScreen
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2), // Durasi fade out
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_alarm,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to My App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        backgroundColor: const Color.fromARGB(255, 46, 182, 255),
        title: const Text('My Apps'),
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
          SimpleFormExample(),
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
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const Text(
              'Welcome To My Apps',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/tes.webp',
                width: 80,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 180,
              child: const Text(
                'Hello, my name is Pikacu. I will guide you in filling out your personal data survey',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      ' Register',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      ' Login',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Text(
                      'log Data',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
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

class SimpleFormExample extends StatefulWidget {
  const SimpleFormExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SimpleFormExampleState createState() => _SimpleFormExampleState();
}

class _SimpleFormExampleState extends State<SimpleFormExample> {
  final _formKey = GlobalKey<FormState>(); // Kunci form untuk validasi
  String? _name;
  String? _email;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Simpan nilai dari field
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Form Submitted"),
          content: Text("Name: $_name\nEmail: $_email"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Text Form Field for Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              const SizedBox(height: 16),
              // Text Form Field for Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 16),
              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
