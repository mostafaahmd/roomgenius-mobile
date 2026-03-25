import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomgenius_mobile/app/routing/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startFlow();
  }

  Future<void> _startFlow() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.go(Routes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('RoomGenius'),
      ),
    );
  }
}