import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'output.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NIC Decoder"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 165, 216),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images.png',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            TextField(
              controller: nicController,
              decoration: const InputDecoration(
                labelText: "Enter your NIC Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nicController.text.isNotEmpty) {
                  Get.to(() => ResultScreen(nicController.text));
                } else {
                  Get.snackbar("Error", "Please enter a valid NIC number",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 146, 55, 127),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Decode"),
            ),
          ],
        ),
      ),
    );
  }
}
