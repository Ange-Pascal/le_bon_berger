import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(
      String? token, Map<String, dynamic> currentUser) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    await box.write(CacheManagerKey.CURRENTUSER.toString(), currentUser);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Map<String, dynamic> getCurrentUser() {
    final box = GetStorage();
    return box.read(CacheManagerKey.CURRENTUSER.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.CURRENTUSER.toString());
  }
}

enum CacheManagerKey { TOKEN, CURRENTUSER }
