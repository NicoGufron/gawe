import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionData = Provider<SessionData>((ref) => SessionDataImpl());

late final Box box;
class HiveInit<T> {
  late final Box<T> box;

  Future<void> init() async {
    print('kontol');
    // box = await Hive.openBox('session_data');
  }
}

abstract class SessionData extends HiveInit {
  String get email;
  set email(String value);

  String get userId;
  set userId(String value);
}

class SessionDataImpl extends SessionData {


  @override
  String get email => box.get("email", defaultValue: '');

  @override
  set email(String value) => box.put("email", value);

  @override
  String get userId => box.get('userId', defaultValue: '');

  @override
  set userId(String value) => box.put("userId", value);
}