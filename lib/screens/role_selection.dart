import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen  extends StatelessWidget{
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4FC3F7),Color(0xFF0288D1)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 150),
            const SizedBox(height: 50),
            _roleButton(context, "Plumber",
              _roleButton(context, "Sales/Marketing"),
          ],
        ),
      ),
    );
  }
  Widget _roleButton(BuildContext context, String title) {
    return Padding(
      padding : const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB3E5FC),
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 55),
          shape: const StadiumBorder(),
        ),
          onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}