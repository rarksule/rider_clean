import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/core/providers/global_providers.dart';
import 'package:rider_clean/features/auth/presentation/provider/auth_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/common.dart';
import '../../../../core/constants/constants.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> data;
  const SignUpScreen({super.key,required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  String? privacyPolicyUrl;
  String? termsConditionUrl;
  bool isAcceptedTc = true;
  @override
  void initState() {
    super.initState();
    privacyPolicyUrl = widget.data["privacy_policy_url"];
          termsConditionUrl = widget.data["terms_condition_url"];
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    // ref.read(.notifier)
    ref.listen(registerFlowProvider, (previous, next) {
      next.whenOrNull(
        data: (result) async {
          toast(result, length: Toast.LENGTH_LONG);
        },
        error: (error, stack) {
          toast(error.toString());
        },
      );
    });
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text(language.createAccount, style: boldTextStyle(size: 22)),
              8.height,
              Text(
                language.createYourAccountToContinue,
                style: primaryTextStyle(),
              ),
              32.height,
              AppTextField(
                controller: firstNameController,
                focus: firstNameFocus,
                nextFocus: lastNameFocus,
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: Common.inputDecoration(label: language.firstName),
              ),
              20.height,
              AppTextField(
                controller: lastNameController,
                focus: lastNameFocus,
                nextFocus: emailFocus,
                autoFocus: false,
                textFieldType: TextFieldType.OTHER,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: Common.inputDecoration(label: language.lastName),
              ),
              20.height,
              AppTextField(
                controller: emailController,
                focus: emailFocus,
                nextFocus: addressFocus,
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: Common.inputDecoration(label: language.email),
              ),
              20.height,
              AppTextField(
                controller: addressController,
                focus: addressFocus,
                nextFocus: phoneFocus,
                autoFocus: false,
                textFieldType: TextFieldType.OTHER,
                keyboardType: TextInputType.multiline,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: Common.inputDecoration(label: language.address),
              ),
              20.height,
              AppTextField(
                controller: phoneController,
                textFieldType: TextFieldType.PHONE,
                focus: phoneFocus,
                decoration: Common.inputDecoration(
                  label: language.phoneNumber,
                  prefixIcon: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CountryCodePicker(
                          padding: EdgeInsets.zero,
                          initialSelection: defaultCountryCode,
                          showCountryOnly: false,
                          enabled: false,
                          dialogSize: Size(
                            MediaQuery.of(context).size.width - 60,
                            MediaQuery.of(context).size.height * 0.6,
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
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                          searchStyle: primaryTextStyle(),
                        ),
                        VerticalDivider(color: Colors.grey.withAlpha(127)),
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
                keyboardType: TextInputType.phone,
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              16.height,
              Row(
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: primaryColor,
                      value: isAcceptedTc,
                      shape: RoundedRectangleBorder(borderRadius: radius(2)),
                      onChanged: (v) async {
                        isAcceptedTc = v!;
                        setState(() {});
                      },
                    ),
                  ),
                  16.width,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${language.iAgreeToThe} ',
                            style: secondaryTextStyle(),
                          ),
                          TextSpan(
                            text: language.termsConditions,
                            style: boldTextStyle(color: primaryColor, size: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (!termsConditionUrl.isEmptyOrNull) {
                                  launchUrl(Uri.parse(termsConditionUrl!));
                                } else {
                                  toast(language.txtURLEmpty);
                                }
                              },
                          ),
                          TextSpan(text: ' & ', style: secondaryTextStyle()),
                          TextSpan(
                            text: language.privacyPolicy,
                            style: boldTextStyle(color: primaryColor, size: 14),
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
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              16.height,
              AppButton(
                width: MediaQuery.of(context).size.width,
                color: primaryColor,
                textStyle: boldTextStyle(color: Colors.white),
                text: language.signUp,
                onTap: () => verifyInput(),
              ),
              20.height,
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      language.alreadyHaveAnAccount,
                      style: primaryTextStyle(),
                    ),
                    8.height,
                    Text(
                      language.logIn,
                      style: boldTextStyle(color: primaryColor),
                    ).onTap(() => pop()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyInput() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    if (!isAcceptedTc) {
      return toast("accpt tc");
    }

    ref
        .read(registerFlowProvider.notifier)
        .call(
          address: addressController.text,
          name: "${firstNameController.text} ${lastNameController.text}",
          email: emailController.text,
          phone: "$defaultCountryCode${phoneController.text}",
        );
  }
}
