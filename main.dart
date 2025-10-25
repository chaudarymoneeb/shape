// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'firebase_options.dart';
// import 'routes.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform.copyWith(
//       databaseURL: 'https://shapeos-smarthome-default-rtdb.firebaseio.com/',
//     ),
//   );

//   runApp(const ProviderScope(child: ShapeOSApp()));
// }

// class ShapeOSApp extends StatelessWidget {
//   const ShapeOSApp({super.key});

// ignore_for_file: unused_local_variable

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'ShapeOS',
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.deepPurple,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.deepPurple,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       themeMode: ThemeMode.system,
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Safe initialization logic
  FirebaseApp? app;
  try {
    app = Firebase.app();
  } on Exception catch (_) {
    // App not initialized yet → initialize now
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform.copyWith(
        databaseURL: 'https://shapeos-smarthome-default-rtdb.firebaseio.com/',
      ),
    );
  }

  runApp(const ProviderScope(child: ShapeOSApp()));
}

class ShapeOSApp extends StatelessWidget {
  const ShapeOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ShapeOS',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
