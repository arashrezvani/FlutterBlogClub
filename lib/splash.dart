import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
/*
برای صفحه اسپلش ابتدا باید صفحه استیت فول ویجت باشه
بعدش در استیت
از تابع این ایت استیت استفاده میکنیم
که یک فیوچر داره با ویژگی دیلید
برای اینکه بگیم چه مدت حالا ثانیه دقیقه ساعت روز رو نشون بده ازش استفاده میکنیم
برای اینکه بعدش چکار کنه از تابع دن استفاده میکنیم که یک تابع هست با ولیو میزاریم
در تابعد از نویگیتور ویژگی افش استفاده میکنیم که کانتکس داره . بعد از اون هم 
پوش داریم هم پوش ریپلیس که پوش برمیگرده پولش ریپلیس نه
داخل پولش ریپلیس از متریال پیج روتر برای اینکه چه صفحه ای رو باز کنه استفاده میکنیم
*/

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              //  کل صفحه رو پر کنه چون بک گراند تصویر کل صفحه رو بپوشونه چون استک هست باید از پوزیشین فیل استفاده کنیم
              //fit: BoxFit.cover//
              //این فیت برای اینه که عکس فیت کاور کنه کل تصویر رو
              child: Assets.img.background.splash.image(fit: BoxFit.cover)),
          Center(
            child: Assets.img.icons.logo.svg(width: 100),
          )
        ],
      ),
    );
  }
}
