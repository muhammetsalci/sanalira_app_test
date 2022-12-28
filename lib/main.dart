import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanalira_flutter_test/screens/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ScreenUtil.init(
      context,
      designSize: const Size(411, 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: const Color(0xFF66CC78),
                canvasColor: const Color(0xFFF3F4F6),
                backgroundColor: const Color(0xFF000000),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: const Color(0xFFFFFFFF),
                    elevation: 0,
                    selectedItemColor: Colors.green[400],
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed),
                textTheme: const TextTheme(
                    headline6: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                    bodyText1: TextStyle(color: Colors.white, fontSize: 13),
                    bodyText2:
                        TextStyle(color: Color(0xFFCFD4DE), fontSize: 11),
                    labelMedium: TextStyle(
                        color: Color(0xFF141C2D),
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                )),
            debugShowCheckedModeBanner: false,
            home: const RegisterScreen(),
          );
        });
  }
}
