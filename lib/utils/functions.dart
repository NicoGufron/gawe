import 'package:flutter/material.dart';
import 'package:gawe/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final SupabaseClient client = Supabase.instance.client;

Future<dynamic> signUpSupabase(BuildContext context, {String? email, String password = ''}) async {
  try {
    final response = await client.auth.signUp(
      email: email, 
      password: password
    );

    if (response.session != null) {
      return false;
    } else {
      return true;
    }
  } on AuthException catch (e) {
    showSnackBar(context, e.message);
  }
}


Future<dynamic> signInSupabase(BuildContext context, {String? email, String password = ''}) async {
  try {
    final response = await client.auth.signInWithPassword(
      email: email, 
      password: password
    );

    if (response.user != null) {
      return response.user;
    }

  } on AuthException catch (e) {
      showSnackBar(context, e.message, backgroundColor: Colors.red);
  }
}


Future<void> signOut() async {
  await client.auth.signOut();
}


// Helper functions
void showSnackBar(BuildContext context, String a, {bool top = false, Color? backgroundColor}) {
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 2000),
    content: Padding(
      padding: EdgeInsets.all(5),
      child: Text(
          a,
          style: TextStyle(fontWeight: FontWeight.bold, color: backgroundColor == Colors.red ? Colors.white : Colors.black, fontSize: 16),
          textAlign: TextAlign.center,
        ),
    ),
      shape: top ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ) : RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      backgroundColor: backgroundColor ?? Constants.primaryColor,
      margin: top ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height  -  (AppBar().preferredSize.height + 100), left: 20, right: 20) : EdgeInsets.fromLTRB(20, 0, 20, 90),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}