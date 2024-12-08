import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPAge(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Flutter Basic App'), // Judul di AppBar
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Pusatkan horizontal
              children: [
                Image.asset(
                  'assets/images/tes.webp',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Hello my name is pikacu.',
                  style: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('Go to About'),
                ),
              ],
            ),
          ),
        ));
  }
}

class AboutPAge extends StatelessWidget {
  const AboutPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
                width: 200,
                child: Text(
                  'this aplication built progress with flutter BY EKoramdani',
                ))
          ],
        ),
      ),
    );
  }
}
