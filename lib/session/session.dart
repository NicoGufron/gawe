import 'package:flutter/widgets.dart';
import 'package:gawe/session/session_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final session = ChangeNotifierProvider<Session>((ref) => Session(ref));

class Session extends ChangeNotifier {
  final Ref _read;
  late final SessionData _data;

  Session(this._read) {
    _data = _read.read(sessionData);
    _email = _data.email;
    _userId = _data.userId;
  }

  String _email = '';

  String get email => _email;

  set email(String value) {
    _email = value;
    _data.email = value;
  }

  String _userId = '';
  String get userId => _userId;

  set userId(String value) {
    _userId = value;
    _data.userId = value;
  }
}