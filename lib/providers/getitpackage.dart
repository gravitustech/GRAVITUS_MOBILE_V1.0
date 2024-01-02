import 'package:get_it/get_it.dart';
import 'bussinesslogic.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => Bussinesslogic());
}
