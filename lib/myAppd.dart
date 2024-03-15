import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lms/Core/Network/local_Network.dart';
import 'package:flutter_lms/Core/routing/routes.dart';
import 'package:flutter_lms/Feature/Auth_Feature/presentation/controller/cubit/auth_cubit_cubit.dart';
import 'package:flutter_lms/Feature/askreya/controller/cubit/askarya_cubit.dart';
import 'package:flutter_lms/Feature/mahad/controller/cubit/doctors_cubit.dart';
import 'package:flutter_lms/Feature/natega/controller/trakomy.dart';
import 'package:flutter_lms/Feature/exam/controller/exam_schedule.dart';
import 'package:flutter_lms/Feature/table/controller/cubit/time_table_cubit.dart';
import 'package:flutter_lms/Feature/table/schedule_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    token = CacheNetwork.getCachedata(key: 'token');
    user = CacheNetwork.getCachedata(key: 'user');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TimeTableCubit()),
        BlocProvider(create: (context) => DoctorsCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TimeTableCubit()),
        BlocProvider(create: (context) => ScheduleCubit()),
        BlocProvider(create: (context) => CumulativeCubit()),
        BlocProvider(create: (context) => ExamCubit()),
        BlocProvider(
          create: (context) => AskaryaCubit()..getAskaeyaData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          initialRoute: '/',
          routes: appRoutes,
        ),
      ),
    );
  }
}
