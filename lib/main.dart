import 'package:chow_now/controller/bottom_sheet_controller.dart';
import 'package:chow_now/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.alegreyaSansTextTheme(),
      ),
      home: MultiProvider(
        // stream: null,
        // builder: (context, snapshot) {
        //   return const HomePage();
        // }
        providers: [
         ChangeNotifierProvider<BottomSheetController>(create: (_) => BottomSheetController(),)
        ],
        child: HomePage(),
      ),
    );
  }
}
