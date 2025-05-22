import 'package:injectable/injectable.dart';
import 'package:encrypt/encrypt.dart';

@lazySingleton
class CryptoService {
  final _key = Key.fromUtf8('my32lengthsupersecretnooneknows!');
  final _iv = IV.fromUtf8('8bytesiv12345678');

  String encryptPassword(String plainText) {
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }
}
