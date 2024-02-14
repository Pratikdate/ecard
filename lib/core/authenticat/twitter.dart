import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';






class TwitterAuth extends StatefulWidget {
  const TwitterAuth({super.key});

  @override
  State<TwitterAuth> createState() => _TwitterAuthState();
}

class _TwitterAuthState extends State<TwitterAuth> {
  final String apiKey = 'wWE3qPOcKbbYP9fLwCiq7oOfj';
  final String apiSecretKey = 'axV3SS9gtTMLb7ympKj3DGrmTzJ5hMCIX2luucq9OnjjOj4qDt';


  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('twitter_login example app'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Twitter API v1.1 is not available when creating a new application in twitter developer from November 15, 2021.\n'
                      'Check the Twitter Developer to see if it supports v1.1 or v2.',
                ),
                const SizedBox(height: 24),
                // Image.asset(
                //   'assets/twitter_dashboard.png',
                //   width: double.infinity,
                // ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    child: const Text('use Twitter API v1'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(160, 48)),
                    ),
                    onPressed: () async {
                      await login();
                    },
                  ),
                ),
                const SizedBox(height: 24),

                Center(
                  child: TextButton(
                    child: const Text('use Twitter API v2.0'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(160, 48)),
                    ),
                    onPressed: () async {
                      await loginV2();
                    },
                  ),
                ),


              ],
            ),
          ),
        ),
      );

  }

  Future login() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: apiKey,

      /// Consumer API Secret keys
      apiSecretKey: apiSecretKey,

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'https://pratikdate.github.io/',
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.login();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
      // success
        print('====== Login success ======');
        print(authResult.authToken);
        print(authResult.authTokenSecret);
        break;
      case TwitterLoginStatus.cancelledByUser:
      // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
      // error
        print('====== Login error ======');
        break;
    }
  }



   Future loginV2() async {
     final twitterLogin = TwitterLogin(
       /// Consumer API keys
       apiKey: apiKey,

       /// Consumer API Secret keys
       apiSecretKey: apiSecretKey,

       /// Registered Callback URLs in TwitterApp
       /// Android is a deeplink
       /// iOS is a URLScheme
       redirectURI: 'com.example.ecard',
     );

     /// Forces the user to enter their credentials
     /// to ensure the correct users account is authorized.
     /// If you want to
     /// implement Twitter account switching, set [force_login] to true
     /// login(forceLogin: true);
     final authResult = await twitterLogin.loginV2();

     switch (authResult) {
       case TwitterLoginStatus.loggedIn:
       // success
         print('====== Login success ======');
         break;
       case TwitterLoginStatus.cancelledByUser:
       // cancel
         print('====== Login cancel ======');
         break;
       case TwitterLoginStatus.error:
       case null:
       // error
         print('====== Login error ======');
         break;
     }
   }

}




