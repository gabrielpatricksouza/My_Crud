import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_crud/app/modules/home/store/home_store.dart';
import 'package:my_crud/app/modules/home/view/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute("/", child: (_, args) => HomePage()),
 ];
}