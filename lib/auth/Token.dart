import 'package:get_storage/get_storage.dart';

class Token {
  static String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }
