import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart' hide OTPTextField;
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:rider_clean/features/auth/presentation/provider/auth_provider.dart';
import 'package:rider_clean/features/dashboard/presentation/dashboard_screen.dart';
import 'package:rider_clean/features/permission/presentation/screens/permission_screen.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../location/presentation/provider/location_providers.dart';
import '../../../permission/presentation/provider/permission_provider.dart';

class VerifyPhoneScreen extends ConsumerStatefulWidget {
  final String phone;
  final String otpId;
  const VerifyPhoneScreen({
    super.key,
    required this.phone,
    required this.otpId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends ConsumerState<VerifyPhoneScreen> {
  OtpFieldController otpController = OtpFieldController();

  int timer = defaultOtpTimer;
  late String otpId;
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  void init() async {
    otpId = widget.otpId;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timer != 0) setState(() => timer--);
    });
  }

  Future<void> reSendOtp() async {
    ref.read(sendOtpFlowProvider.notifier).call(widget.phone);
  }

  Future<void> submit(String otp) async {
    ref
        .read(verifyOtpFlowProvider.notifier)
        .call(phoneNumber: widget.phone, otp: otp, otpId: otpId);
  }

  Future<void> nextPage() async {
    if (await ref
        .read(myPermissionProvider.notifier)
        .isAllPermissionsGranted()) {
      ref.read(geoLocationProvider.notifier).getLocation();
      DashBoardScreen().launch(getContext, isNewTask: true);
    } else {
      PermissionScreen().launch(getContext, isNewTask: true);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final _ = ref.watch(myPermissionProvider);
    ref.listen(sendOtpFlowProvider, (previous, next) {
      next.whenOrNull(
        data: (result) {
          otpId = result;
          timer = defaultOtpTimer;
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });
    ref.listen(verifyOtpFlowProvider, (previous, next) {
      next.whenOrNull(
        data: (result) {
          timer = defaultOtpTimer;
          nextPage();
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text(language.validateOtp)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.height() * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              const Icon(Icons.message, color: primaryColor, size: 50),
              Text(language.validateOtp, style: boldTextStyle(size: 18)),
              Text(
                language.otpCodeHasBeenSentTo,
                style: secondaryTextStyle(size: 16),
                textAlign: TextAlign.center,
              ),
              Text(widget.phone, style: boldTextStyle()),
              const SizedBox(height: 10),
              // Text(language.pleaseEnterOtp,
              // //     style: secondaryTextStyle(size: 16),
              //     textAlign: TextAlign.center),
              OTPTextField(
                controller: otpController,
                length: 4,
                width: context.width() * 0.8,
                fieldWidth: 35,
                style: primaryTextStyle(),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  borderColor: Colors.blue,
                  focusBorderColor: const Color.fromARGB(255, 108, 176, 231),
                  disabledBorderColor: Colors.grey,
                  enabledBorderColor: context.theme.colorScheme.onSurface,
                  errorBorderColor: Colors.red,
                ),
                onChanged: (s) {
                  // 'verId = s;'
                },
                onCompleted: (pin) async {
                  submit(pin);
                },
              ),
              25.height,
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    language.didNotReceiveTheCode,
                    style: secondaryTextStyle(size: 16),
                  ),
                  4.width,
                  timer != 0
                      ? Text(timer.toString())
                      : Text(
                          language.resend,
                          style: boldTextStyle(color: primaryColor),
                        ).onTap(() => reSendOtp()),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
