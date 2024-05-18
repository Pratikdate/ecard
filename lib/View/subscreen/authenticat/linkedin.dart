
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';







const String redirectUrl = 'com.example.ecard://';
const String clientId = '77ksdosm40ksnb';
const String clientSecret = '77ksdosm40ksnb';


class LinkedinAuth extends StatefulWidget {
  const LinkedinAuth({super.key});

  @override
  State<LinkedinAuth> createState() => _LinkedinAuthState();
}

class _LinkedinAuthState extends State<LinkedinAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter LinkedIn demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person), text: 'Profile'),
                Tab(icon: Icon(Icons.text_fields), text: 'Auth code'),
              ],
            ),
            title: const Text('LinkedIn Authorization'),
          ),
          body: const TabBarView(
            children: [
              LinkedInProfileExamplePage(),
              LinkedInAuthCodeExamplePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkedInProfileExamplePage extends StatefulWidget {
  const LinkedInProfileExamplePage({super.key});

  @override
  State createState() => _LinkedInProfileExamplePageState();
}

class _LinkedInProfileExamplePageState
    extends State<LinkedInProfileExamplePage> {
  UserObject? user;
  bool logoutUser = false;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          LinkedInButtonStandardWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (final BuildContext context) => LinkedInUserWidget(
                    useVirtualDisplay: true,
                    redirectUrl: redirectUrl,
                    clientId: clientId,
                    clientSecret: clientSecret,
                    onGetUserProfile: (UserSucceededAction linkedInUser) {
                      setState(() {

                        // user = UserObject(
                        //   // firstName: linkedInUser.user.firstName?.localized?.label ?? '',
                        //   // lastName: linkedInUser.user.lastName?.localized?.label ?? '',
                        //   // email: linkedInUser.user.email?.elements?.first.handleDeep?.emailAddress ?? '',
                        //   // profileImageUrl: linkedInUser.user.profilePicture?.displayImageContent?.elements?.first.identifiers?.first.identifier ?? '',
                        // );
                      });
                      Navigator.pop(context);
                    },
                    onError: (UserFailedAction e) {
                      print('Error: ${e.toString()}');
                    },
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          LinkedInButtonStandardWidget(
            onTap: () {
              setState(() {
                user = null;
                logoutUser = true;
              });
            },
            buttonText: 'Logout',
          ),
          if (user != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('First: ${user?.firstName} '),
                Text('Last: ${user?.lastName} '),
                Text('Email: ${user?.email}'),
                if (user?.profileImageUrl != null)
                  Image.network(user!.profileImageUrl!),
              ],
            ),
        ],
      ),
    );
  }
}

class LinkedInAuthCodeExamplePage extends StatefulWidget {
  const LinkedInAuthCodeExamplePage({super.key});

  @override
  State createState() => _LinkedInAuthCodeExamplePageState();
}

class _LinkedInAuthCodeExamplePageState
    extends State<LinkedInAuthCodeExamplePage> {
  AuthCodeObject? authorizationCode;
  bool logoutUser = false;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LinkedInButtonStandardWidget(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (final BuildContext context) => LinkedInAuthCodeWidget(
                  destroySession: logoutUser,
                  redirectUrl: redirectUrl,
                  clientId: clientId,
                  onError: (final AuthorizationFailedAction e) {
                    print('Error: ${e.toString()}');
                    print('Error: ${e.stackTrace.toString()}');
                  },
                  onGetAuthCode: (final AuthorizationSucceededAction response) {
                    print('Auth code ${response.codeResponse.code}');
                    print('State: ${response.codeResponse.state}');

                    setState(() {
                      authorizationCode = AuthCodeObject(
                        code: response.codeResponse.code,
                        state: response.codeResponse.state,
                      );
                    });

                    Navigator.pop(context);
                  },
                  scope: [LiteProfileScope(), EmailAddressScope()],
                ),
                fullscreenDialog: true,
              ),
            );
          },
        ),
        LinkedInButtonStandardWidget(
          onTap: () {
            setState(() {
              authorizationCode = null;
              logoutUser = true;
            });
          },
          buttonText: 'Logout user',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Auth code: ${authorizationCode?.code} '),
              Text('State: ${authorizationCode?.state} '),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthCodeObject {
  AuthCodeObject({required this.code, required this.state});

  final String? code;
  final String? state;
}

class UserObject {
  UserObject({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;
}
