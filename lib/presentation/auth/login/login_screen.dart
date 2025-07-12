import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_social_login_button.dart';
import 'notifier/login_notifier.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFFDCF3,
        body: SizedBox(
          width: double.maxFinite,
          height: 800.h,
          child: Stack(
            children: [
              _buildMainContent(context),
              _buildBottomDecorativeElement(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [_buildHeaderSection(context), _buildLoginForm(context)],
      ),
    );
  }

  /// Section Widget
  Widget _buildHeaderSection(BuildContext context) {
    return SizedBox(
      height: 135.h,
      width: double.maxFinite,
      child: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse3,
            height: 115.h,
            width: 95.h,
            alignment: Alignment.topLeft,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse4,
            height: 124.h,
            width: 100.h,
            alignment: Alignment.topRight,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgPerfectplateremovebgpreview1,
            height: 135.h,
            width: 118.h,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 18.h),
          ),
          Positioned(
            top: 61.h,
            left: 146.h,
            child: Text(
              'Masuk',
              style: TextStyleHelper.instance.headline24Bold.copyWith(
                height: 1.25,
              ),
            ),
          ),
          Positioned(
            top: 91.h,
            left: 86.h,
            child: Text(
              'Masak makin menyenangkan!',
              style: TextStyleHelper.instance.body15Bold.copyWith(height: 1.27),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 39.h),
      child: Column(
        children: [
          _buildEmailInput(context),
          SizedBox(height: 19.h),
          _buildPasswordInput(context),
          SizedBox(height: 27.h),
          _buildLoginButton(context),
          SizedBox(height: 12.h),
          _buildForgotPasswordLink(context),
          SizedBox(height: 18.h),
          _buildDivider(context),
          SizedBox(height: 17.h),
          _buildSocialLoginButtons(context),
          SizedBox(height: 18.h),
          _buildRegistrationLink(context),
          SizedBox(height: 9.h),
          _buildPrivacyPolicy(context),
          SizedBox(height: 82.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(loginNotifier);
        return Container(
          height: 32.h,
          decoration: BoxDecoration(
            color: appTheme.whiteCustom,
            border: Border.all(color: appTheme.colorFFDBDB),
            borderRadius: BorderRadius.circular(5.h),
          ),
          child: Row(
            children: [
              SizedBox(width: 9.h),
              CustomImageView(
                imagePath: ImageConstant
                    .img4105936emailenvelopemailmessagesnailmail1139381,
                height: 13.h,
                width: 16.h,
              ),
              SizedBox(width: 7.h),
              Expanded(
                child: TextFormField(
                  controller: state.emailController,
                  style: TextStyleHelper.instance.body14,
                  decoration: InputDecoration(
                    hintText: 'anonymous@gmail.com',
                    hintStyle: TextStyleHelper.instance.body14,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    ref.read(loginNotifier.notifier).updateEmail(value);
                  },
                ),
              ),
              SizedBox(width: 9.h),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordInput(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(loginNotifier);
        return Container(
          height: 32.h,
          decoration: BoxDecoration(
            color: appTheme.whiteCustom,
            border: Border.all(color: appTheme.colorFFDBDB),
            borderRadius: BorderRadius.circular(5.h),
          ),
          child: Row(
            children: [
              SizedBox(width: 9.h),
              CustomImageView(
                imagePath:
                    ImageConstant.img3643755hidelocklockedpadlockprivate1134281,
                height: 16.h,
                width: 16.h,
              ),
              SizedBox(width: 7.h),
              Expanded(
                child: TextFormField(
                  controller: state.passwordController,
                  obscureText: true,
                  style: TextStyleHelper.instance.body14.copyWith(
                    color: appTheme.blackCustom,
                  ),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: TextStyleHelper.instance.body14,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    ref.read(loginNotifier.notifier).updatePassword(value);
                  },
                ),
              ),
              SizedBox(width: 9.h),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(loginNotifier);
        return GestureDetector(
          onTap: () {
            ref.read(loginNotifier.notifier).handleLogin();
          },
          child: Container(
            width: double.maxFinite,
            height: 32.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFFEDD,
              border: Border.all(color: appTheme.colorFFDBDB),
              borderRadius: BorderRadius.circular(5.h),
            ),
            child: Center(
              child: state.isLoading
                  ? SizedBox(
                      height: 16.h,
                      width: 16.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          appTheme.whiteCustom,
                        ),
                      ),
                    )
                  : Text('Masuk', style: TextStyleHelper.instance.title16Bold),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildForgotPasswordLink(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ref.read(loginNotifier.notifier).handleForgotPassword();
        },
        child: Text(
          'Lupa kata sandi kamu?',
          style: TextStyleHelper.instance.body15Bold,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1.h, color: appTheme.blackCustom),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: Text('atau', style: TextStyleHelper.instance.body15),
        ),
        Expanded(
          child: Container(height: 1.h, color: appTheme.blackCustom),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSocialLoginButtons(BuildContext context) {
    return Column(
      children: [
        CustomSocialLoginButton(
          text: 'Masuk dengan Facebook',
          iconPath: ImageConstant.imgFacebookroundedsolidiconicons1,
          onPressed: () {
            ref.read(loginNotifier.notifier).handleSocialLogin('Facebook');
          },
        ),
        SizedBox(height: 13.h),
        CustomSocialLoginButton(
          text: 'Masuk dengan Google',
          iconPath: ImageConstant.imgGoogleiconicons1,
          onPressed: () {
            ref.read(loginNotifier.notifier).handleSocialLogin('Google');
          },
        ),
        SizedBox(height: 13.h),
        CustomSocialLoginButton(
          text: 'Masuk dengan Line',
          iconPath: ImageConstant.img1485482196line786751,
          onPressed: () {
            ref.read(loginNotifier.notifier).handleSocialLogin('Line');
          },
        ),
        SizedBox(height: 13.h),
        CustomSocialLoginButton(
          text: 'Masuk dengan X',
          iconPath: ImageConstant.imgTwitterxnewlogoxroundedicon2560781,
          onPressed: () {
            ref.read(loginNotifier.notifier).handleSocialLogin('X');
          },
        ),
        SizedBox(height: 13.h),
        CustomSocialLoginButton(
          text: 'Masuk dengan Tiktok',
          iconPath: ImageConstant.imgTiktoklogoicon1868961,
          onPressed: () {
            ref.read(loginNotifier.notifier).handleSocialLogin('TikTok');
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRegistrationLink(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Belum punya akun? ',
              style: TextStyleHelper.instance.body15.copyWith(
                color: appTheme.blackCustom,
              ),
            ),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  ref.read(loginNotifier.notifier).navigateToRegister();
                },
                child: Text(
                  'Daftar',
                  style: TextStyleHelper.instance.body15Bold.copyWith(
                    color: appTheme.blackCustom,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPrivacyPolicy(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.h),
      child: Text(
        'Dengan menggunakan Perfect Plate, kamu menyetujui\nKetentuan Pemakaian & Kebijakan Privasi kami',
        textAlign: TextAlign.center,
        style: TextStyleHelper.instance.label10.copyWith(height: 1.2),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomDecorativeElement(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup1,
        height: 63.h,
        width: 71.h,
      ),
    );
  }
}
