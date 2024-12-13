import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gawe/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: '${dotenv.env['API_URL']}',
    anonKey: '${dotenv.env['API_KEY']}'
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.karlaTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: const Splash()
      ),
    );
  }
}
