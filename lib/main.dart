import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_tes/dbServices/dbHelp.dart';
import 'package:no_tes/views/screens/addNotePage.dart';
import 'package:no_tes/views/screens/details.dart';
import 'package:no_tes/views/screens/editNotePage.dart';
import 'package:no_tes/views/screens/home.dart';

Db database = Db();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: home(),
      getPages: [
        GetPage(name: '/', page: () => home()),
        GetPage(name: '/addNotePage', page: () => addNotePage()),
        GetPage(name: '/detailsPage', page: () => detailsNotePage()),
        GetPage(name: '/editNotePage', page: () => editNotePage()),
      ],
    );
  }
}
