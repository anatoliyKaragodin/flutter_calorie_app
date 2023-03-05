import 'package:flutter_calorie_app/utils/library.dart';
import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/user_data_start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
           theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const UserDataStartPage(),
    );
  }
}
