import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/core/constants/enums.dart';
import 'package:rider_clean/core/providers/global_providers.dart';
import 'package:rider_clean/features/dashboard/presentation/dashboard_screen.dart';

import '../../../../core/constants/constants.dart';
import '../../../location/presentation/provider/location_providers.dart';
import '../provider/permission_provider.dart';

class PermissionScreen extends ConsumerStatefulWidget {
  const PermissionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PermissionScreenState();
}

class _PermissionScreenState extends ConsumerState<PermissionScreen> {
  bool granted = false;
  bool stuck = false;
  List<PermissionType> permissions = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    ref.listenManual(myPermissionProvider, (previous, next) {
      next.whenOrNull(
        data: (result) async {
          result.fold(
            (l) {
              permissions
                ..clear()
                ..addAll(l);
              if (permissions.isNotEmpty) {
                toast("${permissions.first.toString().replaceFirst("PermissionType", '')} is Not Allowed");
              }
            },
            (r) async {
              if (await ref
                  .read(myPermissionProvider.notifier)
                  .isAllPermissionsGranted()) {
                ref.read(geoLocationProvider.notifier).getLocation();
                DashBoardScreen().launch(context);
              }
            },
          );
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                locationPermission,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
              Text(
                language.mostReliableShiwRiderApp,
                style: boldTextStyle(size: 18),
              ),
              const SizedBox(height: 16),
              Text(
                language.toEnjoyYourRideExperiencePleaseAllowPermissions,
                style: secondaryTextStyle(color: primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AppButton(
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                onTap: () async {
                  await ref
                      .read(myPermissionProvider.notifier)
                      .getDeniedPermissions();
                  if (permissions.isNotEmpty) {
                    for (var t in permissions) {
                      await ref
                          .read(myPermissionProvider.notifier)
                          .requestPermission(type: t);
                    }
                  }

                  // await AppSettings.openAppSettings(type: AppSettingsType.batteryOptimization);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (granted)
                      const CircularProgressIndicator(color: Colors.white),
                    8.width,
                    Text(
                      !granted ? language.allow : 'getting_location...',
                      style: boldTextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              16.height,
              if (stuck) Text(language.stuckHint),
            ],
          ),
        ),
      ),
    );
  }

  void setHint() async {
    await Future.delayed(Duration(minutes: 1)).then((val) {
      setState(() {
        stuck = true;
      });
    });
  }

  void init() {
    ref.listenManual(geoLocationProvider, (previous, next) {
      next.whenOrNull(
        data: (result) {
          if (result != null) {
            setValue("locationData", result);
          }
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });
  }
}
