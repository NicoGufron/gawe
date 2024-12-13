import 'package:flutter/material.dart';
import 'package:gawe/components/input.dart';
import 'package:gawe/components/main_button.dart';
import 'package:gawe/utils/constants.dart';
import 'package:gawe/utils/functions.dart';
import 'package:gawe/models/sign_up_provider.dart';
import 'package:gawe/signin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUp extends StatefulHookConsumerWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final signUp = ref.watch(signUpProvider);

    return Scaffold(
      body: SizedBox(
          width: width,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Constants.accentColor
                  ),
                  child: Text('Daftar Akun', style: TextStyle(color: Constants.textColor, fontSize: 28, fontWeight: FontWeight.bold))),
                SizedBox(height: 40),
                TextInput(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                  onChanged: (value) => {
                    signUp.email = value
                  }
                ),
                const SizedBox(height: 20),
                TextInput(
                  hintText: 'Kata sandi',
                  isHidden: true,
                  type: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock_open_rounded, color: Colors.black,),
                  onChanged: (value) => {
                    signUp.password = value
                  },
                ),
                const SizedBox(height: 20),
                TextInput(
                  hintText: 'Konfirmasi Kata sandi',
                  isHidden: true,
                  type: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock_open_rounded, color: Colors.black),
                  onChanged: (value) => {
                    signUp.confirmPassword = value
                  }
                ),
                SizedBox(height: 10),
                // InkWell(
                //   child: Text("Lupa password?",
                //   style: TextStyle(color: Constants.hintTextGray, fontSize: 16),)
                // ),
                SizedBox(height: 40),
                Center(
                  child: MainButton(
                    text: 'Daftar', 
                    width: width * 0.4,
                    disable: signUp.disable,
                    loading: loading,
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });
                      FocusScope.of(context).unfocus();
                      await signUpSupabase(context, email: signUp.email, password: signUp.password).then((value) => null);

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
                     const Text('Sudah memiliki akun? ', 
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
                        child: const Text('Masuk disini', 
                          style: TextStyle(
                            fontSize: 16, 
                            color: Constants.hintTextGray, 
                            decoration: TextDecoration.underline, 
                            fontWeight: FontWeight.bold
                          )
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
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