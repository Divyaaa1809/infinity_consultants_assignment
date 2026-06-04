import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/spend_summary/presentation/views/spend_summary_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Summary',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,

        scaffoldBackgroundColor: const Color(0xFFF6F7FB),

        appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      ),

      home: const SpendSummaryScreen(),
    );
  }
}
