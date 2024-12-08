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
          title: const Text('Flutter Basic App'), // Judul di AppBar
        ),
        body: Column(
          children: [
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: const Text('data')),
            )
          ],
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
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            const Text('data'),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: const Text('data'))
          ],
        ),
      ),
    );
  }
}
