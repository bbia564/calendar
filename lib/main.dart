import 'package:event_calendar/db_event/db_event.dart';
import 'package:event_calendar/pages/event_add/event_add_binding.dart';
import 'package:event_calendar/pages/event_add/event_add_view.dart';
import 'package:event_calendar/pages/event_first/event_first_binding.dart';
import 'package:event_calendar/pages/event_first/event_first_view.dart';
import 'package:event_calendar/pages/event_second/event_second_binding.dart';
import 'package:event_calendar/pages/event_second/event_second_view.dart';
import 'package:event_calendar/pages/event_tab/event_tab_binding.dart';
import 'package:event_calendar/pages/event_tab/event_tab_view.dart';
import 'package:event_calendar/pages/event_third/event_third_binding.dart';
import 'package:event_calendar/pages/event_third/event_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff6873f7);
Color bgColor = const Color(0xfffafafa);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBEvent().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Ens,
      initialRoute: '/eventTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Ens = [
  GetPage(name: '/eventTab', page: () => EventTabPage(), binding: EventTabBinding()),
  GetPage(name: '/eventFirst', page: () => EventFirstPage(), binding: EventFirstBinding()),
  GetPage(name: '/eventSecond', page: () => EventSecondPage(), binding: EventSecondBinding()),
  GetPage(name: '/eventThird', page: () => EventThirdPage(), binding: EventThirdBinding()),
  GetPage(name: '/eventAdd', page: () => EventAddPage(), binding: EventAddBinding())
];
