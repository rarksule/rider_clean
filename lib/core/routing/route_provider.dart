// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:rider_clean/features/auth/presentation/screens/verify_phone_screen.dart';
// import '../../core/routing/route_names.dart';
// import '../../features/auth/presentation/screens/signup_screen.dart';
// import '../../features/dashboard/presentation/dashboard_screen.dart';
// import '../../features/introduction/presentation/screens/introduction_screen.dart';
// import '../../features/auth/presentation/screens/signin_screen.dart';
// import '../../features/splash/presentation/screens/splash_screen.dart';

// final routerProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//     initialLocation: '/splash',
//     routes: [
//       GoRoute(
//         path: '/splash',
//         name: splashRoute,
//         builder: (context, state) => const SplashScreen(),
//       ),
//       GoRoute(
//         path: '/dashboard',
//         name: dashBoardRoute,
//         builder: (context, state) => const DashBoardScreen(),
//       ),
//       GoRoute(
//         path: '/signin',
//         name: signinRoute,
//         builder: (context, state) => const SignInScreen(),
//       ),
//       GoRoute(
//         path: '/signup',
//         name: signUpRoute,
//         builder: (context, state) => const SignUpScreen(),
//       ),
//       GoRoute(path: '/verifyphone',
//       name:verifyPhoneRoute,
//       builder: (context, state) => VerifyPhoneScreen(phone: state.extra.toString()),),
//       // GoRoute(
//       //   path: '/signup',
//       //   name: signUpRoute,
//       //   builder: (context, state) {
//       //     final data = state.pathParameters["id"]!;
//       //     final data = state.extra as Key;
//       //     return const SignUpScreen(key: data);
//       //   },
//       // ),
//       GoRoute(
//         path: '/introduction',
//         name: introductionRoute,
//         builder: (context, state) => const IntroductionScreen(),
//       ),
//     ],
//   );
// });
