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

                // زر الحجز
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.local_taxi),
                    label: const Text(
                      'احجز سيارة',
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

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  int passengers = 1;
  String carType = 'سيارة عادية';

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void confirmBooking() {
    if (pickupController.text.trim().isEmpty ||
        destinationController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع المعلومات'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تم استلام الطلب'),
          content: const Text(
            'تم تسجيل طلبك بنجاح.\nسيتم البحث عن أقرب سائق لك.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('حجز سيارة'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.location_on,
                size: 70,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: pickupController,
                decoration: const InputDecoration(
                  labelText: 'موقع الانطلاق',
                  hintText: 'مثال: شارع العباس',
                  prefixIcon: Icon(Icons.my_location),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: destinationController,
                decoration: const InputDecoration(
                  labelText: 'الوجهة',
                  hintText: 'إلى أين تريد الذهاب؟',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: carType,
                decoration: const InputDecoration(
                  labelText: 'نوع السيارة',
                  prefixIcon: Icon(Icons.directions_car),
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'سيارة عادية',
                    child: Text('سيارة عادية'),
                  ),
                  DropdownMenuItem(
                    value: 'سيارة مريحة',
                    child: Text('سيارة مريحة'),
                  ),
                  DropdownMenuItem(
                    value: 'سيارة كبيرة',
                    child: Text('سيارة كبيرة'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      carType = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<int>(
                value: passengers,
                decoration: const InputDecoration(
                  labelText: 'عدد الركاب',
                  prefixIcon: Icon(Icons.people),
                  border: OutlineInputBorder(),
                ),
                items: List.generate(
                  6,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1} راكب'),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      passengers = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: confirmBooking,
                  icon: const Icon(Icons.check),
                  label: const Text(
                    'تأكيد طلب السيارة',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
