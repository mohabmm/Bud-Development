import 'package:budupdated/inherited/auth.dart';
import 'package:budupdated/inherited/authprovider.dart';
import 'package:budupdated/views/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements BaseAuth {
  MockAuth(BuildContext context);
}

void main() {
  Widget makeTestableWidget({Widget child, BaseAuth auth}) {
    return AuthProvider(
      auth: auth,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('email or password is empty, does not sign in',
      (WidgetTester tester) async {
    BuildContext context;
    MockAuth mockAuth = MockAuth(context);

    // so it is intially false if sign is called it will be true but it is not called so it returns false
    bool didSignIn = false;
    SigninForm page = SigninForm(onSignedIn: () => didSignIn = true);

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    await tester.tap(find.byKey(Key('login')));

    verifyNever(mockAuth.signInWithEmailAndPassword(
      '',
      '',
    ));
    expect(didSignIn, false);
  });

  testWidgets(
      'non-empty email and password, valid account, call sign in, succeed',
      (WidgetTester tester) async {
    BuildContext context;

    MockAuth mockAuth = MockAuth(context);
//    when(mockAuth.signInWithEmailAndPassword('email', 'password', context))
//        .thenAnswer((invocation) => Future.value('uid'));

    bool didSignIn = false;
    SigninForm page = SigninForm(onSignedIn: () => didSignIn = true);

    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'mohab.magdy1@msa.edu.eg');
//    await tester.pump();

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, '123456');
//    await tester.pump();
//        BuildContext context;

    await tester.tap(find.byKey(Key('login')));

    verify(mockAuth.signInWithEmailAndPassword(
            'mohab.magdy1@msa.edu.eg', '123456'))
        .called(1);
    expect(didSignIn, true);
  });

//
//  testWidgets(
//      'non-empty email and password, valid account, call sign in, fails',
//      (WidgetTester tester) async {
//    MockAuth mockAuth = MockAuth();
//    when(mockAuth.signInWithEmailAndPassword('email', 'password'))
//        .thenThrow(StateError('invalid credentials'));
//
//    bool didSignIn = false;
//    LoginPage page = LoginPage(onSignedIn: () => didSignIn = true);
//
//    await tester.pumpWidget(makeTestableWidget(child: page, auth: mockAuth));
//
//    Finder emailField = find.byKey(Key('email'));
//    await tester.enterText(emailField, 'email');
//
//    Finder passwordField = find.byKey(Key('password'));
//    await tester.enterText(passwordField, 'password');
//
//    await tester.tap(find.byKey(Key('signIn')));
//
//    verify(mockAuth.signInWithEmailAndPassword('email', 'password')).called(1);
//    expect(didSignIn, false);
//  });
}
