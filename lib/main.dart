
import 'package:flutter/material.dart';

void main() {
  runApp(const TaxiKarbalaApp());
}

class TaxiKarbalaApp extends StatelessWidget {
  const TaxiKarbalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تاكسي كربلاء',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تاكسي كربلاء'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_taxi,
                  size: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'مرحباً بك في تاكسي كربلاء',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'اطلب سيارة بسهولة وسرعة',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'طلب سيارة',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
