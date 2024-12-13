import 'package:flutter/material.dart';
import 'package:gawe/components/input.dart';
import 'package:gawe/components/main_button.dart';
import 'package:gawe/session/session.dart';
import 'package:gawe/utils/constants.dart';
import 'package:gawe/utils/functions.dart';
import 'package:gawe/jobs.dart';
import 'package:gawe/models/sign_in_provider.dart';
import 'package:gawe/signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignIn extends StatefulHookConsumerWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}


class _SignInState extends ConsumerState<SignIn> {

  bool loading = false;
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final user = ref.watch(signInProvider);

    // final sessionData = ref.watch(session);

    return Scaffold(
      body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Constants.accentColor
                  ),
                  child: Text('Masuk ke Aplikasi', style: TextStyle(color: Constants.textColor, fontSize: 28, fontWeight: FontWeight.bold))),
                SizedBox(height: 40),
                TextInput(
                  hintText: "Your email",
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                  onChanged: (value) => {
                    user.email = value
                  }
                ),
                const SizedBox(height: 20),
                TextInput(
                  hintText: "Your password",
                  isHidden: true,
                  type: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock_open_rounded, color: Colors.black),
                  onChanged: (value) => {
                    user.password = value
                  },
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Text("Lupa password?",
                  style: TextStyle(color: Constants.hintTextGray, fontSize: 16),)
                ),
                SizedBox(height: 40),
                Center(
                  child: MainButton(
                    text: 'LOGIN', 
                    width: width * 0.4, 
                    disable: user.disable,
                    loading: loading,
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });
                      FocusScope.of(context).unfocus();
                      await signInSupabase(context, email: user.email, password: user.password).then((value) {
                        if (value != null) {
                          // sessionData.email = value.email;
                          // sessionData.userId = value.userId;
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Jobs()));

                        }
                      });

                      setState(() {
                        loading = false;
                      });
                    },
                  )
                ),
                const SizedBox(height: 40),
                Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text('Tidak memiliki akun? ', 
                      style: TextStyle(
                        fontSize: 16, 
                        color: Constants.hintTextGray,
                        fontWeight: FontWeight.bold
                        )
                      ),
                     Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Constants.primaryColor,
                        borderRadius: BorderRadius.all((Radius.circular(15)))
                      ),
                       child: InkWell(
                        child: const Text('Daftar disini', 
                          style: TextStyle(
                            fontSize: 16, 
                            color: Constants.hintTextGray, 
                            decoration: TextDecoration.underline, 
                            fontWeight: FontWeight.bold
                          )
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                        },
                      ),
                     )
                   ],
                 ),
              ],
            ),
          ),
        ),
    );
  }
}
