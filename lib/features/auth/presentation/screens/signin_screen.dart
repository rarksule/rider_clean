import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/features/auth/presentation/screens/verify_phone_screen.dart';
import '../../../../core/providers/global_providers.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/common.dart';
import '../../../../core/constants/constants.dart';
import '../../../notification/presentation/provider/notification_providers.dart';
import '../provider/auth_provider.dart';
import 'signup_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  String? privacyPolicyUrl;
  String? termsConditionUrl;
  bool isAcceptedTc = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    ref.read(notifcationProvider.notifier).getToken();
    phoneController.text = getStringAsync(phoneNumber).replaceFirst('+251', '');
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      if (isAcceptedTc) {
        setValue(
          phoneNumber,
          '$defaultCountryCode${phoneController.text.trim()}',
        );
        ref
            .read(sendOtpFlowProvider.notifier)
            .sendOtp('$defaultCountryCode${phoneController.text.trim()}');
      } else {
        toast(
          ref.read(languageProvider).pleaseAcceptTermsOfServicePrivacyPolicy,
        );
      }
    }
  }

  Future<void> appSetting() async {
    // await getAppSettingApi().then((value) {
    //   if (value.privacyPolicyModel != null) {
    //     appStore.setPrivacyPolicy(value.privacyPolicyModel!.value.validate());
    //     privacyPolicy = value.privacyPolicyModel!.value.validate();
    //   }
    //   if (value.termsCondition != null) {
    //     appStore.setTermsCondition(value.termsCondition!.value.validate());
    //     termsCondition = value.termsCondition!.value.validate();
    //   }
    //   setState(() {});
    // }).catchError((error) {
    //   log(error.toString());
    // });
  }
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final otpFlow = ref.watch(sendOtpFlowProvider);
    final _ = ref.watch(notifcationProvider);
    ref.listen(sendOtpFlowProvider, (previous, next) {
      next.whenOrNull(
        data: (result) async {
          if (!_hasNavigated) {
            _hasNavigated = true;
            bool? val = await VerifyPhoneScreen(
              phone: "+251${phoneController.text}",
              otpId: result,
            ).launch(context);
            if (val == null) {
              _hasNavigated = false;
            }
          }
          // context.goNamed(verifyPhoneRoute, extra: phoneController.text);
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.height() * 0.30,
                color: primaryColor,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(appLogo, height: 130, width: 130),
                  ),
                ),
              ),
              Container(
                width: context.width(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        30.height,
                        Text(language.logIn, style: boldTextStyle(size: 24)),
                        8.height,
                        Text(
                          language.signInUsingYourMobileNumber,
                          style: secondaryTextStyle(size: 16),
                        ),
                        30.height,
                        Text(language.phoneNumber, style: primaryTextStyle()),
                        8.height,
                        AppTextField(
                          controller: phoneController,
                          textFieldType: TextFieldType.PHONE,
                          decoration: Common.inputDecoration(
                            prefixIcon: IntrinsicHeight(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CountryCodePicker(
                                    enabled: false,
                                    initialSelection: defaultCountryCode,
                                    showCountryOnly: false,
                                    dialogSize: Size(
                                      context.width() * 0.3,
                                      context.height() * 0.6,
                                    ),
                                    showFlag: true,
                                    showFlagDialog: true,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                    textStyle: primaryTextStyle(),
                                    dialogBackgroundColor: context.cardColor,
                                    barrierColor: Colors.black12,
                                    dialogTextStyle: primaryTextStyle(),
                                    searchDecoration: InputDecoration(
                                      iconColor: context.dividerColor,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: context.dividerColor,
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    searchStyle: primaryTextStyle(),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey.withAlpha(127),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return language.thisFieldRequired;
                            }
                            if (value.trim().length != phoneLengthLimit) {
                              return language.phoneLengthLimit;
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        16.height,
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: primaryColor,
                          title: RichTextWidget(
                            list: [
                              TextSpan(
                                text: '${language.iAgreeToThe} ',
                                style: secondaryTextStyle(),
                              ),
                              TextSpan(
                                text: language.termsConditions,
                                style: boldTextStyle(
                                  color: primaryColor,
                                  size: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (!termsConditionUrl.isEmptyOrNull) {
                                      launchUrl(Uri.parse(termsConditionUrl!));
                                    } else {
                                      toast(language.txtURLEmpty);
                                    }
                                  },
                              ),
                              TextSpan(
                                text: ' & ',
                                style: secondaryTextStyle(),
                              ),
                              TextSpan(
                                text: language.privacyPolicy,
                                style: boldTextStyle(
                                  color: primaryColor,
                                  size: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    if (!privacyPolicyUrl.isEmptyOrNull) {
                                      launchUrl(Uri.parse(privacyPolicyUrl!));
                                    } else {
                                      toast(language.txtURLEmpty);
                                    }
                                  },
                              ),
                            ],
                          ),
                          value: isAcceptedTc,
                          onChanged: (val) async {
                            isAcceptedTc = val!;
                            setState(() {});
                          },
                        ),
                        16.height,

                        AppButton(
                          width: context.width(),
                          color: primaryColor,
                          textStyle: boldTextStyle(color: Colors.white),
                          text: language.logIn,
                          onTap: () async {
                            if (!otpFlow.isLoading) {
                              submit();
                            }
                          },
                        ),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              language.donHaveAnAccount,
                              style: primaryTextStyle(),
                            ),
                            4.width,
                            Text(
                              language.signUp,
                              style: boldTextStyle(color: primaryColor),
                            ).onTap(() {
                              // context.goNamed(signUpRoute);
                              const SignUpScreen().launch(
                                context,
                                duration: const Duration(milliseconds: 500),
                                pageRouteAnimation: PageRouteAnimation.Slide,
                              );
                            }),
                          ],
                        ),
                        16.height,
                      ],
                    ),
                  ),
                ),
              ).expand(),
            ],
          ),
          Visibility(
            visible: otpFlow.isLoading,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
