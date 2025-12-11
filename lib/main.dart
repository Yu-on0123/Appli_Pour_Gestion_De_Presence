import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Généré par flutterfire CLI
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Initialise Firebase seulement si nous ne sommes pas sur le web
    // ou si les options web sont disponibles
    if (kIsWeb) {
      // Pour le web, utilisez une configuration basique
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "fake-key-for-testing",
          appId: "1:123456789012:web:abcdef123456",
          messagingSenderId: "123456789012",
          projectId: "test-project",
        ),
      );
    } else {
      // Pour les autres plateformes, utilisez les options générées
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    print("Firebase initialization error (continuing without Firebase): $e");
    // Continuez sans Firebase pour le moment
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion de présence',
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}