import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'decoder.dart';

class ResultScreen extends StatelessWidget {
  final String nic;

  const ResultScreen(this.nic, {super.key});

  @override
  Widget build(BuildContext context) {
    NICDecoder decoder;
    try {
      decoder = NICDecoder(nic);
    } catch (e) {
      return Scaffold(
        appBar: AppBar(title: const Text("NIC Decoder")),
        body: const Center(child: Text("Invalid NIC format!")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("NIC Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("NIC Type: ${decoder.nicType}",
                style: TextStyle(fontSize: 18)),
            Text("Date of Birth: ${decoder.dateOfBirth}",
                style: TextStyle(fontSize: 18)),
            Text("Weekday: ${decoder.weekday}", style: TextStyle(fontSize: 18)),
            Text("Age: ${decoder.age}", style: TextStyle(fontSize: 18)),
            Text("Gender: ${decoder.gender}", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
