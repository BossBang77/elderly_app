import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  static String encryptAES(plainText) {
    Encrypted? encrypted;
    final key = Key.fromSecureRandom(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptAES(plainText) {
    var decrypted;
    final key = Key.fromSecureRandom(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(plainText!, iv: iv);
    return decrypted;
  }

  //for Fernet Algorithms
  static Encrypted? fernetEncrypted;
  static var fernetDecrypted;
  static encryptFernet(plainText) {
    final key = Key.fromSecureRandom(32);
    final iv = IV.fromLength(16);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    fernetEncrypted = encrypter.encrypt(plainText);
    print(fernetEncrypted!.base64); // random cipher text
    print(fernet.extractTimestamp(fernetEncrypted!.bytes));
  }

  static decryptFernet(plainText) {
    final key = Key.fromSecureRandom(32);
    final iv = IV.fromLength(16);
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes));
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    fernetDecrypted = encrypter.decrypt(fernetEncrypted!);
    print(fernetDecrypted);
  }
}
