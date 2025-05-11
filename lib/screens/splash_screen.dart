// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sriway/route/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 4)); // Splash duration
    if (mounted) {
      Navigator.pushReplacementNamed(context, loginScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
          Container(color: const Color.fromARGB(139, 0, 0, 0)),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Image.asset('assets/images/logo.png', width: 70, height: 70),
                const SizedBox(height: 20),
                const Text(
                  'SriWay',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Welcome to Sri Lanka',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Sri Lankan Travel Partner',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                      backgroundColor: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
