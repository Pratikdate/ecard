
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterAuth extends StatefulWidget {
  const TwitterAuth({super.key});

  @override
  State<TwitterAuth> createState() => _TwitterAuthState();
}

class _TwitterAuthState extends State<TwitterAuth> {
  final String apiKey = 'kQXviMc8iMT86xA9J48hDY5Hu';
  final String apiSecretKey = 'dS8NEEqpQhT736EGnsSpf63aBI0IFcJM2qDo5NNnHB5MRvsJlM';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Twitter Login Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Twitter API v1.1 is not available when creating a new application in Twitter Developer from November 15, 2021.\n'
                    'Check the Twitter Developer to see if it supports v1.1 or v2.',
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  child: const Text('Use Twitter API v2.0'),
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

  Future<void> loginV2() async {
    final twitterLogin = TwitterLogin(
      apiKey: apiKey,
      apiSecretKey: apiSecretKey,
      redirectURI: 'com.example.ecard://',
    );

    final authResult = await twitterLogin.loginV2();
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print('====== Login success ======');
        //await _signInWithTwitter(authResult);
        break;
      case TwitterLoginStatus.cancelledByUser:
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      default:
        print('====== Login error ======');
        break;
    }
  }

  // Future<void> _signInWithTwitter(TwitterLoginResult authResult) async {
  //   final twitterAuthCredential = TwitterAuthProvider.credential(
  //     accessToken: authResult.authToken!,
  //     secret: authResult.authTokenSecret!,
  //   );
  //
  //   try {
  //     final userCredential = await _auth.signInWithCredential(twitterAuthCredential);
  //     print('Signed in successfully as: ${userCredential.user?.displayName}');
  //   } catch (e) {
  //     print('Failed to sign in with Twitter: $e');
  //   }
  // }
}
