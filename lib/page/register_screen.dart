import 'package:aplikasi/notifier/registration_controller.dart';
import 'package:aplikasi/utils/constant.dart';
import 'package:aplikasi/utils/validator.dart';
import 'package:aplikasi/widget/note_button.dart';
import 'package:aplikasi/widget/note_form_field.dart';
import 'package:aplikasi/widget/note_icon_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:aplikasi/page/recover_pass.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegistrationController registrationController;

  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;

  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    registrationController = context.read();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();

    formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Selector<RegistrationController, bool>(
                selector: (_, controller) => controller.isRegisterMode, 
                builder: (_, isRegisterMode, __) => Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Lottie.asset('Asset/lottielogin.json'),
                      Text(isRegisterMode ? 'Daftar' : 'Sign In',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Masuk atau daftar', textAlign: TextAlign.center),
                      const SizedBox(height: 48),
                      if(isRegisterMode) ...[
                        NoteFormField(
                          controller: nameController,
                          labelText: 'Nama Lengkap....',
                          fillColor: white,
                          filled: true,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          validator: Validator.nameValidator,
                          onChanged: (newValue){
                            registrationController.fullName = newValue;
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                      NoteFormField(
                        controller: emailController,
                        labelText: 'Email...',
                        fillColor: white,
                        filled: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: Validator.emailValidator,
                        onChanged: (newValue){
                          registrationController.email = newValue;
                        },
                      ),
                      const SizedBox(height: 8),
                      Selector<RegistrationController, bool>(
                        selector: (_, controller) => controller.isPasswordHidden, 
                        builder: (_, isPasswordHidden, __) => NoteFormField(
                          controller: passwordController,
                          labelText: 'Password...',
                          fillColor: white,
                          filled: true,
                          obscureText: isPasswordHidden,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              registrationController.isPasswordHidden = !isPasswordHidden;
                            },
                            child: Icon(isPasswordHidden ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash),
                          ),
                          validator: Validator.passwordValidator,
                          onChanged: (newValue){
                            registrationController.password = newValue;
                          }
                        ),
                      ),
                      const SizedBox(height: 12),
                      if(!isRegisterMode) ...[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const RecoverPasswordPage()));
                          },
                          child: const Text(
                            'Lupa Password',
                            style: TextStyle(color: primary,
                            fontWeight: FontWeight.bold),),
                        ),
                        const SizedBox(height: 24),
                      ],
                      SizedBox(
                        height: 48,
                        child: Selector<RegistrationController, bool>(
                          selector: (_, controller) => controller.isLoading,
                          builder: (_, isLoading, __) => NoteButton(
                            onPressed: isLoading ? null : (){
                              if(formKey.currentState?.validate() ?? false){
                                registrationController.authenticationWithEmailAndPassword(context: context);
                              }
                            },
                            child: isLoading ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(color: white,) 
                            )
                            : Text(isRegisterMode ? 'Buat akun' : 'Login'),
                          )
                        )
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: Divider()),
                            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(isRegisterMode ? 'Daftar Menggunakan' : 'Login Menggunakan')),
                            const Expanded(child: Divider())
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: NoteIconButtonOutlined(
                              icon: FontAwesomeIcons.google, 
                              onPressed: (){
                                registrationController.authenticateWithGoogle(context: context);
                              }
                            )
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: NoteIconButtonOutlined(
                              icon: FontAwesomeIcons.linkedin, 
                              onPressed: (){

                              }
                            )
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text.rich(TextSpan(
                        text: isRegisterMode ? 'Sudah Memiliki Akun' : 'Tidak Memiliki Akun',
                        style: const TextStyle(color: grey700),
                        children: [
                          TextSpan(
                            text: isRegisterMode ? ' Login' : ' Daftar',
                            style: const TextStyle(
                              color: text,
                              fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              registrationController.isRegisterMode = !isRegisterMode;
                            }
                          )
                        ]
                      ),
                      textAlign: TextAlign.center,
                    )
                   ],
                  ),
                ),
              )
            ),
          ),
        )),
    );
  }
} 