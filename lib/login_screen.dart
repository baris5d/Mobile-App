import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dashboard_screen.dart';
import 'users.dart';
import 'custom_route.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!mockUsers.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
*/
    return FlutterLogin(
      title: "Animai",
      logo: 'assets/images/ecorp.png',
       messages: LoginMessages(
         usernameHint: 'E-Posta',
         passwordHint: 'Şifre',
         confirmPasswordHint: 'Şifreyi tekrar girin',
         loginButton: 'Giriş Yap',
         signupButton: 'Kayıt Ol',
         forgotPasswordButton: 'Şifreni mi unuttun?',
         recoverPasswordButton: 'Kurtar',
         goBackButton: 'Geri git',
         confirmPasswordError: 'Şifreler uyuşmuyor!',
         recoverPasswordIntro: 'Üzülme, bu her zaman başımıza geliyor.',
         recoverPasswordDescription: 'Şifreni sıfırlayabilmen için sana bir link göndereceğiz.',
         recoverPasswordSuccess: 'Şifre başarıyla kurtarıldı.',
      ),
      emailValidator: (value) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Gerçek bir e-Posta adresi girin";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Şifrenizi girin';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => MyApp(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
      },
      //showDebugButtons: true,
    );
  }
}