import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Config/AppRoutes/route_imports.dart';
import 'Utils/Const/color_const.dart';
import 'Utils/Extensions/text_extension.dart';


void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.splash,
          title: 'Khadim App',
          theme: ThemeData(
            fontFamily: 'ProductSans',
            /// White & Black
            textTheme: TextTheme(
              displayLarge: GoogleFonts.ptSans().copyWith(
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              displayMedium: GoogleFonts.ptSans().copyWith(
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              displaySmall: GoogleFonts.ptSans().copyWith(
                fontSize: 34.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              headlineLarge: GoogleFonts.ptSans().copyWith(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              headlineMedium: GoogleFonts.ptSans().copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              headlineSmall: GoogleFonts.ptSans().copyWith(
                fontSize: 26.sp,
                color: black,
                fontWeight: FontWeight.w700,
              ),
              titleLarge: GoogleFonts.ptSans().copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              titleMedium: GoogleFonts.ptSans().copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: black,
              ),
              titleSmall: GoogleFonts.ptSans().copyWith(
                fontSize: 18.sp,
                color: black,
                fontWeight: FontWeight.w400,
              ),
              bodyLarge: GoogleFonts.ptSans().copyWith(
                  fontSize: 16.sp, fontWeight: FontWeight.w400, color: black),
              bodyMedium: GoogleFonts.ptSans().copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: black,
              ),
              bodySmall: GoogleFonts.ptSans().copyWith(
                fontSize: 12.sp,
                color: grey,
                fontWeight: FontWeight.w400,
              ),
              labelLarge: GoogleFonts.ptSans().copyWith(
                fontSize: 10.sp,
                color: grey,
                fontWeight: FontWeight.w400,
              ),
              labelMedium: GoogleFonts.ptSans().copyWith(
                fontSize: 8.sp,
                color: grey,
                fontWeight: FontWeight.w400,
              ),
            ),

            /// Scaffold
            scaffoldBackgroundColor: primary,

            /// App Bar
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: secondary,
              ),
              titleTextStyle: GoogleFonts.ptSans().copyWith(
                fontSize: 26.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            /// ElevatedButtonThemeData
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500.0.r),
                ),
                fixedSize: Size(394.w, 54.h),
                backgroundColor: secondary,
                foregroundColor: black,
                textStyle:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
            ),

            ///Input Decoration
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'ProductSans',
              ),
              prefixStyle: TextStyle(fontSize: 20.sp),
              focusColor: grey,
              contentPadding: EdgeInsets.only(
                left: 18.w,
                top: 16.h,
                bottom: 19.h,
              ),
              filled: true,
              fillColor: white.withOpacity(0.2),
              prefixIconColor: white,
              suffixIconColor: white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide(color: white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide(color: white),
              ),
            ),

            /// Icon
            iconTheme: IconThemeData(color: primary),

          checkboxTheme: CheckboxThemeData(
  fillColor: MaterialStateProperty.resolveWith(
    (Set<MaterialState> states) {
      // Color when checked
      if (states.contains(MaterialState.selected)) {
        return primary;
      }
      // Color when unchecked
      return Colors.white;
    },
  ),
  side: MaterialStateBorderSide.resolveWith(
    (Set<MaterialState> states) {
      // Border color when unchecked
      if (states.contains(MaterialState.selected)) {
        return BorderSide(color: primary); // optional: border when checked
      }
      return BorderSide(color: Colors.grey); // grey border when unchecked
    },
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4), // optional: rounded corners
  ),
),


            /// Scrollbar
           scrollbarTheme: ScrollbarThemeData(

             radius: Radius.circular(10.r),
             interactive: true,
             thumbVisibility: MaterialStateProperty.all(false),
             trackVisibility: MaterialStateProperty.all(true),
    thumbColor: MaterialStateProperty.all(primary),
    // trackColor: MaterialStateProperty.all(primary.withOpacity(0.2)),
    trackBorderColor: MaterialStateProperty.all(primary.withOpacity(0.1)),
  ),
            /// Bottom Navigation Bar
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: primary,
              unselectedLabelStyle: const TextStyle(fontSize: 12.0),
              selectedLabelStyle: TextStyle(fontSize: 12.sp),
              selectedItemColor: white,
              unselectedItemColor: grey,
              selectedIconTheme: IconThemeData(color: white),
            ),

            /// Dialog
            dialogTheme: DialogThemeData(
              elevation: 0,
              backgroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),

            /// Tab Bar
            tabBarTheme: TabBarThemeData(
              labelColor: primary,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: grey,
              indicatorColor: primary,
              labelStyle: context.bodyMedium,
              unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3,
                  color: secondary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
