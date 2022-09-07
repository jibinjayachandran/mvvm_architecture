import 'package:flutter/material.dart';
import 'package:halian/ui/features/splash/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context)=>SplashProvider()..init(),
      builder: (context,child) {
        return Consumer<SplashProvider>(
          builder: (context,provider,child) {
            return const Scaffold(
              body: Center(
                child:Text('SeatGeek',style: TextStyle(fontSize: 22,color: Colors.black87,),)
              ),
            );
          }
        );
      },
    );
  }
}
