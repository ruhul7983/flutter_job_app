import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_app/provider/user_provider.dart';
import 'package:job_app/screens/after_logged_splash.dart';
import 'package:job_app/screens/splash_screen.dart';
import 'package:job_app/utils/colors.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

late Size mq;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Job App',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black))
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return AfterLoginSplash();
              }else if(snapshot.hasError){
                return SplashScreen();
              }
            }
            return SplashScreen();
          }
        ),
      ),
    );
  }
}