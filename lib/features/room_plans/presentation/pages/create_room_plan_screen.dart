import 'package:flutter/material.dart';

class CreateRoomPlanScreen extends StatelessWidget {
  const CreateRoomPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Room'),
      ),
      body: const Center(
        child: Text('Create Room Plan Screen'),
      ),
    );
  }
}