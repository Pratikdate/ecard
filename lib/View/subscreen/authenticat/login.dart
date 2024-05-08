import 'package:animated_login/animated_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import '../../coreRes/color_handler.dart';
import '../../routes/dashboard.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthMode currentMode = AuthMode.login;

  Future<String?> onLogin(LoginData data) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: data.email, password: data.password);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login successfully"),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
      ));

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("email not found,please signup first"),
          backgroundColor: Colors.red.withOpacity(0.5),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("wrong pass or email address"),
          backgroundColor: Colors.red.withOpacity(0.5),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.code),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  Future<String?> onSignup(SignUpData data) async {
    //SignUpData(pratik, p@gmail.com, 12DCcc, 12DCcc)
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: data.email, password: data.password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Residtrstion successfully login"),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password proviide to weak"),
          backgroundColor: Colors.green,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Email already in use"),
          backgroundColor: Colors.red.withOpacity(0.5),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.code),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  onForgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email successfully send"),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("user not found"),
          backgroundColor: Colors.red.withOpacity(0.5),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("wrong password"),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  Future<String?> _onForgotPassword(String email) async {
    //await _operation?.cancel();
    return await onForgotPassword(email);
  }

//social authentiation
  List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
        SocialLogin(
          iconPath: 'assets/images/auth_img/google.png',
          callback: () => signInWithGoogle(),
        ),
        SocialLogin(
            callback: () async => signInWithGoogle(),
            iconPath: 'assets/images/auth_img/linkedin.png'),
        SocialLogin(
            callback: () => signInWithTwitter(),
            iconPath: 'assets/images/auth_img/X.png'),
      ];

  Future<String?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(credential);
    if (userCredential.user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("successfully login"),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
          (route) => false);
    }
  }

  Future<String?> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
        apiKey: 'c1WjNg9Na0kSUwVhEFyQdAJ9I',
        apiSecretKey: '8eipsvmZ4X5yvhlYdBiTW1LMqWTWrbF8v0pWEYwPKNdjBQozjO',
        redirectURI: '/home');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    if (userCredential.user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("successfully login"),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: (LoginData data) => onLogin(data),
      onSignup: (SignUpData data) => onSignup(data),
      onForgotPassword: _onForgotPassword,
      //logo: Image.asset('assets/images/logo.gif'),

      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins(context),
      loginDesktopTheme: _desktopTheme,
      loginMobileTheme: _mobileTheme,
      loginTexts: _loginTexts,
      emailValidator: ValidatorModel(
          validatorCallback: (String? email) => 'What an email! $email'),
    );
  }
}

LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
      // To set the color of button text, use foreground color.
      actionButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(ColorHandler.normalFont),
      ),
      dialogTheme: const AnimatedDialogTheme(
        languageDialogTheme: LanguageDialogTheme(
            optionMargin: EdgeInsets.symmetric(horizontal: 80)),
      ),
      loadingSocialButtonColor: Colors.blue,
      loadingButtonColor: ColorHandler.normalFont,
      privacyPolicyStyle: const TextStyle(color: ColorHandler.bgColor),
      privacyPolicyLinkStyle: const TextStyle(
          color: ColorHandler.bgColor, decoration: TextDecoration.underline),
    );

LoginViewTheme get _mobileTheme => LoginViewTheme(
      // showLabelTexts: false,
      backgroundColor: ColorHandler.bgColor, // const Color(0xFF6666FF),
      formFieldBackgroundColor: ColorHandler.normalFont,
      formWidthRatio: 60,
      actionButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      animatedComponentOrder: const <AnimatedComponent>[
        AnimatedComponent(
          component: LoginComponents.logo,
          animationType: AnimationType.right,
        ),
        AnimatedComponent(component: LoginComponents.title),
        AnimatedComponent(component: LoginComponents.description),
        AnimatedComponent(component: LoginComponents.formTitle),
        AnimatedComponent(component: LoginComponents.socialLogins),
        AnimatedComponent(component: LoginComponents.useEmail),
        AnimatedComponent(component: LoginComponents.form),
        AnimatedComponent(component: LoginComponents.notHaveAnAccount),
        AnimatedComponent(component: LoginComponents.forgotPassword),
        AnimatedComponent(component: LoginComponents.policyCheckbox),
        AnimatedComponent(component: LoginComponents.changeActionButton),
        AnimatedComponent(component: LoginComponents.actionButton),
      ],
      privacyPolicyStyle: const TextStyle(color: ColorHandler.normalFont),
      privacyPolicyLinkStyle: const TextStyle(
          color: ColorHandler.normalFont, decoration: TextDecoration.underline),
    );

LoginTexts get _loginTexts => LoginTexts(
      nameHint: _username,
      login: _login,
      signUp: _signup,
      // signupEmailHint: 'Signup Email',
      // loginEmailHint: 'Login Email',
      // signupPasswordHint: 'Signup Password',
      // loginPasswordHint: 'Login Password',
    );

String get _username => 'Username';

String get _login => 'Login';

String get _signup => 'Sign Up';
