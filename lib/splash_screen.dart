// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';

import 'Welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to Welcome screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Logo
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 120,
                height: 120,
              ),

              SizedBox(height: 30),

              // App Name
              Text(
                'ShapeOS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: 10),

              // Tagline
              Text(
                'Smart Home Automation',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  letterSpacing: 1,
                ),
              ),

              SizedBox(height: 50),

              // Loader
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'Welcome_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 2000),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );

//     _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
//     );

//     _animationController.forward();

//     // Navigate to welcome screen after 3 seconds
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) =>
//               WelcomeScreen(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF667eea), Color(0xFF764ba2)],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Animated Logo
//               AnimatedBuilder(
//                 animation: _animationController,
//                 builder: (context, child) {
//                   return Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: Container(
//                         width: 120,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               blurRadius: 20,
//                               offset: Offset(0, 10),
//                             ),
//                           ],
//                         ),
//                         child: Image.asset('assets/images/logo.png'),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               SizedBox(height: 30),

//               // Animated Text
//               // Animated Logo
//               AnimatedBuilder(
//                 animation: _animationController,
//                 builder: (context, child) {
//                   return Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: FadeTransition(
//                       opacity: _fadeAnimation,
//                       child: Image.asset(
//                         'assets/images/logo.png', // sirf logo
//                         width: 120,
//                         height: 120,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               SizedBox(height: 30),

//               // Animated Text
//               AnimatedBuilder(
//                 animation: _fadeAnimation,
//                 builder: (context, child) {
//                   return FadeTransition(
//                     opacity: _fadeAnimation,
//                     child: Column(
//                       children: [
//                         Text(
//                           'ShapeOS',
//                           style: TextStyle(
//                             fontSize: 36,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             letterSpacing: 2,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Smart Home Automation',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white70,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),

//               SizedBox(height: 50),

//               FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                   strokeWidth: 2,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
