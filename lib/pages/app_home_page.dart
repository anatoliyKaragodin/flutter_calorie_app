import 'package:flutter_calorie_app/pages/home_pages/user_data_start_page/user_data_start_page.dart';
import 'package:flutter_calorie_app/riverpod/riverpod.dart';
import 'package:flutter_calorie_app/utils/library.dart';

import 'home_pages/main_app_page/main_app_page.dart';

class AppHomePage extends ConsumerStatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends ConsumerState<AppHomePage> {
  final List pages = [UserDataStartPage(), MainAppPage()];
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(myAppPageIndexProvider);
    return pages.elementAt(index);
  }
}
