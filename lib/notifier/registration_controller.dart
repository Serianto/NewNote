import 'package:aplikasi/service/auth_service.dart';
import 'package:aplikasi/utils/constant.dart';
import 'package:aplikasi/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationController extends ChangeNotifier{
  bool _isRegisterMode = true;
  bool get isRegisterMode => _isRegisterMode;
  set isRegisterMode(bool value){
    _isRegisterMode = value;
    notifyListeners();
  }

  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  set isPasswordHidden(bool value){
    _isPasswordHidden = value;
    notifyListeners();
  }

  String _fullName = '';
  set fullName(String value){
    _fullName = value;
    notifyListeners();
  }

  String get fullName => _fullName.trim();

  String _email = '';
  set email(String value){
    _email = value;
    notifyListeners();
  }

  String get email => _email.trim();

  String _password = '';
  set password(String value){
    _password = value;
    notifyListeners();
  }

  String get password => _password;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  Future<void> authenticationWithEmailAndPassword(
    {required BuildContext context}) async{
      isLoading = true;
      try{
        if(_isRegisterMode){
          await AuthService.register(
            fullName: fullName, 
            email: email, 
            password: password);

            if(!context.mounted) return;
            showMessageDialog(
              context: context, 
              message: 'Link verifikasi telah dikirim');

              while(!AuthService.isEmailVerified){
                await Future.delayed(const Duration(seconds: 5),
                () => AuthService.user?.reload());
              }
        }else{
          AuthService.login(
            email: email, 
            password: password);
        }
      } on FirebaseAuthException catch(e){
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: authExceptionMapper[e.code] ?? 'Ada error');
      } catch(e){
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: 'Dibilang ada eror');
      } finally {
        isLoading = false;
      }
    }

    Future<void> authenticateWithGoogle({required BuildContext context}) async{
      try{
        await AuthService.signInWithGoogle();
      } on NoGoogleAccountChosenException{
        return;
      } catch (e) {
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: 'Ada yang eror');
      }
    }
    Future<void>resetPassword({
      required BuildContext context,
      required String email,
    }) async{
      isLoading = true;
      try{
        await AuthService.resetPassword(email: email);
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: 'reset password telah dikirimkan melalui $email');
      } on FirebaseAuthException catch (e){
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: authExceptionMapper[e.code] ?? 'Ada eror');
      } catch (e){
        if(!context.mounted) return;
        showMessageDialog(
          context: context, 
          message: 'Error');
      } finally{
        isLoading = false;
      }
    }
}
    class NoGoogleAccountChosenException implements Exception{
      const NoGoogleAccountChosenException();
    }