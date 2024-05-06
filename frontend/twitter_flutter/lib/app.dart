import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:twitter_flutter/features/home/bloc/home_bloc.dart';
import 'package:twitter_flutter/features/login/bloc/login_bloc.dart';
import 'package:twitter_flutter/features/main_page/bloc/main_bloc.dart';
import 'package:twitter_flutter/features/main_page/ui/main_page.dart';
import 'package:twitter_flutter/features/register/bloc/register_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TwitterClone",
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: (getToken()) ? const MainPage() : const MainPage(),
      ),
    );
  }

  bool getToken() {
    var box = Hive.box('token');
    String jwt = box.get('token', defaultValue: "");

    if (jwt == "") return false;
    if (JwtDecoder.isExpired(jwt)) return false;
    debugPrint("Token: $jwt");

    return true;
  }
}
