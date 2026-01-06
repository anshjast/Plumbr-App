import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_drop_down, color: Colors.blue),
                    Text("English",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Icon(Icons.star_rounded, size: 100, color: Colors.orange),
              const Text("CERA STAR PLUMBER",
                  style: TextStyle(fontWeight: FontWeight.bold)
              ),

              const SizedBox(height: 20),
              const Text("Login to continue",
                  style: TextStyle(fontSize: 20, color: Colors.black87)
              ),
              const SizedBox(height: 40),
              Material(
                elevation: 12,
                shadowColor: Colors.black26,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: const TextStyle(color: Colors.lightBlue),
                    prefixIcon: const Icon(Icons.phone_outlined, color: Colors.lightBlue),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),

              const SizedBox(height: 50),
              _buildActionButton(
                context,
                "Send OTP",
                isGradient: true,
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),

              const SizedBox(height: 20),
              _buildActionButton(
                context,
                "New Registration",
                isGradient: false,
                onPressed: () {
                },
              ),

              const SizedBox(height: 50),
              _buildFooter(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildActionButton(BuildContext context, String text, {required bool isGradient, required VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: isGradient
            ? const LinearGradient(colors: [Color(0xFF81D4FA), Color(0xFF00B8D4)])
            : null,
        border: isGradient ? null : Border.all(color: const Color(0xFF00B8D4), width: 1.5),
        boxShadow: isGradient
            ? [const BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 5))]
            : [],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_outline, color: Colors.grey, size: 28),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: "By signing up you indicate that you have read and agreed to the ",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              children: [
                TextSpan(
                    text: "Terms And Conditions ",
                    style: TextStyle(color: Colors.blue.shade300, decoration: TextDecoration.underline)
                ),
                const TextSpan(text: "and "),
                TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Colors.blue.shade300, decoration: TextDecoration.underline)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}