import 'package:aplikasi/notifier/registration_controller.dart';
import 'package:aplikasi/utils/constant.dart';
import 'package:aplikasi/utils/validator.dart';
import 'package:aplikasi/widget/note_back_button.dart';
import 'package:aplikasi/widget/note_button.dart';
import 'package:aplikasi/widget/note_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  late final TextEditingController emailController;

  GlobalKey<FormFieldState> emailKey = GlobalKey();

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NoteBackButton(),
        title: const Text('Lupa Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Jangan Panik', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              NoteFormField(
                key: emailKey,
                controller: emailController,
                fillColor: white,
                filled: true, 
                labelText: 'Email',
                validator: Validator.emailValidator,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: Selector<RegistrationController, bool>(
                  selector: (_, controller) => controller.isLoading,
                  builder: (_, isLoading, __) => NoteButton(
                    onPressed: isLoading
                    ? null : () {
                      if(emailKey.currentState?.validate() ?? false){
                        context.read<RegistrationController>().resetPassword(context: context, email: emailController.text.trim());
                      }
                    },
                    child: isLoading ? const SizedBox(
                      width: 24, 
                      height: 24, 
                      child: CircularProgressIndicator(color: white,)
                    ) : Text('Kirim link')
                  )
                )
              )
            ],
          ),
        ),),
    );
  }
}