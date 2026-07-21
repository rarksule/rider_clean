import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '/features/auth/presentation/screens/signin_screen.dart';
import '/features/dashboard/presentation/dashboard_screen.dart';
import '/features/introduction/presentation/screens/introduction_screen.dart';
import '/core/constants/constants.dart';
import '/core/constants/enums.dart';
import '/features/splash/presentation/provider/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(splashStateProvider.notifier).resolveDestination(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashStateProvider, (prev, next) {
      next.whenOrNull(
        data: (destination) {
          switch (destination) {
            case SplashDestination.dashboard:
              DashBoardScreen().launch(context, isNewTask: true);
              break;
            case SplashDestination.signIn:
              SignInScreen().launch(context, isNewTask: true);
              break;
            case SplashDestination.introduction:
              IntroductionScreen().launch(context, isNewTask: true);
              break;
            default:
          }
        },
        error: (error, stackTrace) {
          toast(error.toString());
        },
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(24),
              child: Image.asset(appLogo, height: 140, width: 140),
            ),
            const SizedBox(height: 24),
            // const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
