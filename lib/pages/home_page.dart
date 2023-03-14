import 'package:flutter_calorie_app/pages/app_home_page.dart';
import 'package:flutter_calorie_app/utils/library.dart';
import '../main.dart';
import 'home_page_clear.dart';
import 'home_page_web.dart';

class HomePage extends ConsumerStatefulWidget {
  final String route = 'home page';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final List<Widget> homePages = <Widget>[
    const AppHomePage(),
    const HomePageWeb(),
    const HomePageClear(),
  ];

  @override
  Widget build(BuildContext context) {
    print('__________________________HOME PAGE INDEX: $homePageIndex');

    return SafeArea(
      child: homePages.elementAt(homePageIndex));
  }

 
}
