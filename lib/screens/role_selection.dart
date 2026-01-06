import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PlumbrApp());
}

class PlumbrApp extends StatelessWidget {
  const PlumbrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plumbr App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RoleSelectionScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4FC3F7), Color(0xFF0288D1)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            const Icon(Icons.plumbing_rounded, size: 120, color: Colors.white),
            const Text(
              "CERA STAR\nPLUMBER",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 2),
            _buildRoleButton(context, "Plumber"),
            const SizedBox(height: 15),
            _buildRoleButton(context, "Sales/Marketing"),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB3E5FC),
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 55),
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
class LoginScreen extends StatelessWidget {
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
              // Language Selector
              const Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_drop_down, color: Colors.blue),
                    Text("English", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Icon(Icons.star_rounded, size: 100, color: Colors.orange),
              const Text("Login to continue", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 50),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              _loginButton(context, "Send OTP", true),
              const SizedBox(height: 20),
              _loginButton(context, "New Registration", false),
              const SizedBox(height: 60),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context, String text, bool isGradient) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: isGradient ? null : Border.all(color: const Color(0xFF00B8D4), width: 1.5),
        gradient: isGradient ? const LinearGradient(colors: [Color(0xFF81D4FA), Color(0xFF00B8D4)]) : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const StadiumBorder(),
        ),
        onPressed: () => Navigator.pushNamed(context, '/home'),
        child: Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
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
                TextSpan(text: "Terms And Conditions ", style: TextStyle(color: Colors.blue.shade300, decoration: TextDecoration.underline)),
                const TextSpan(text: "and "),
                TextSpan(text: "Privacy Policy", style: TextStyle(color: Colors.blue.shade300, decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// --- 3. HOME SCREEN ---
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE1F5FE), Color(0xFF00B8D4)],
          ),
        ),
        child: Column(
          children: [
            // White Header Card
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Row(
                children: [
                  const CircleAvatar(radius: 30, backgroundColor: Colors.blueGrey, child: Icon(Icons.person, color: Colors.white)),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suraj test", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Star Plumber ID: 7678601874", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.logout, color: Colors.cyan)),
                ],
              ),
            ),
            // Menu Items List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  _menuItem("Performance", Icons.rocket_launch),
                  _menuItem("Scan Code", Icons.qr_code_scanner),
                  _menuItem("Redeem Stars", Icons.card_giftcard),
                  _menuItem("Schemes / Offers", Icons.lightbulb_outline),
                  _menuItem("Dealer Locator", Icons.location_on_outlined),
                  _menuItem("Info Desk", Icons.info_outline),
                  _menuItem("Raise Ticket", Icons.confirmation_number_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3), // Glassmorphism effect
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black, width: 1.5)),
          child: Icon(icon, color: Colors.black, size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const CircleAvatar(
          radius: 12,
          backgroundColor: Colors.black26,
          child: Icon(Icons.chevron_right, size: 16, color: Colors.black),
        ),
      ),
    );
  }
}