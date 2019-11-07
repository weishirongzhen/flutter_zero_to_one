import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/home_screen.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDefault.init();
  runApp(MyApp());

  // 以下两行 设置android状态栏为透明的沉浸，和导航栏为主题色，写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.green,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => HistoryNotifier()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
