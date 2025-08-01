import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/auth/login_screen.dart';
import 'theme/theme_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PawsyApp());
}

class PawsyApp extends StatelessWidget {
  const PawsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pawsy',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: 'Poppins',
              useMaterial3: true,
              colorSchemeSeed: Colors.pink,
            ),
            darkTheme: ThemeData.dark().copyWith(
              textTheme:
                  ThemeData.dark().textTheme.apply(fontFamily: 'Poppins'),
              colorScheme: const ColorScheme.dark(
                primary: Colors.pink,
              ),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
