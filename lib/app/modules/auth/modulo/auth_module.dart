import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_crud/app/modules/auth/store/auth_store.dart';
import 'package:my_crud/app/modules/auth/view/splash_screen.dart';

class AuthModule extends Module{
  @override
  List<Bind> get binds => [
    Bind((i) => AuthStore()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => SplashScreen()),
  ];
}