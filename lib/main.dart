import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FFAppState(); // Initialize FFAppState

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = ThemeMode.system;

  Stream<DecentrabancFirebaseUser> userStream;
  DecentrabancFirebaseUser initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = decentrabancFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decentrabanc',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/DecentrabancBT.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? NavBarPage()
              : LandingWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'MY_Card';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'loginPage': LoginPageWidget(),
      'MY_Card': MYCardWidget(),
      'MY_Budgets': MYBudgetsWidget(),
      'MY_profilePage': MYProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).darkBackground,
        selectedItemColor: Color(0xFFFBF8F8),
        unselectedItemColor: FlutterFlowTheme.of(context).grayLight,
        selectedBackgroundColor: Color(0x00000000),
        borderRadius: 8,
        itemBorderRadius: 8,
        margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        width: double.infinity,
        elevation: 10,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0
                      ? Color(0xFFFBF8F8)
                      : FlutterFlowTheme.of(context).grayLight,
                  size: 24,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? Color(0xFFFBF8F8)
                        : FlutterFlowTheme.of(context).grayLight,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 1
                      ? FontAwesomeIcons.solidCreditCard
                      : Icons.credit_card,
                  color: currentIndex == 1
                      ? Color(0xFFFBF8F8)
                      : FlutterFlowTheme.of(context).grayLight,
                  size: 20,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? Color(0xFFFBF8F8)
                        : FlutterFlowTheme.of(context).grayLight,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 2
                      ? Icons.stacked_line_chart_rounded
                      : Icons.stacked_line_chart_rounded,
                  color: currentIndex == 2
                      ? Color(0xFFFBF8F8)
                      : FlutterFlowTheme.of(context).grayLight,
                  size: 24,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? Color(0xFFFBF8F8)
                        : FlutterFlowTheme.of(context).grayLight,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  currentIndex == 3
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: currentIndex == 3
                      ? Color(0xFFFBF8F8)
                      : FlutterFlowTheme.of(context).grayLight,
                  size: 24,
                ),
                Text(
                  '•',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? Color(0xFFFBF8F8)
                        : FlutterFlowTheme.of(context).grayLight,
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
