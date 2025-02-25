import 'package:auth_module/Colors/appcolors.dart';
import 'package:auth_module/CustomWidgets/custom_button.dart';
import 'package:auth_module/CustomWidgets/textwidget.dart';
import 'package:auth_module/Fonts/fonts.dart';
import 'package:auth_module/Images/app_images.dart';
import 'package:auth_module/Signup/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _rememberMe = false;
  void _toggleRememberMe(bool? newValue) {
    setState(() {
      _rememberMe = newValue ?? false;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: _formKey,
            onChanged: _updateButtonState,
            child: Column(
              children: [
                const SizedBox(height: 110),
                Image.asset(Images.welcome),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: TextWidget(
                    text: 'Email',
                    fontfamily: Fonts.poppins,
                    color: AppColors.featherGrey,
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _emailController,
                    validator: _validateEmail,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'example@gmail.com',
                      hintStyle: TextStyle(fontFamily: Fonts.poppins),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide:
                            BorderSide(color: AppColors.black, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: TextWidget(
                    text: 'Password',
                    fontfamily: Fonts.poppins,
                    color: AppColors.featherGrey,
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _passwordController,
                    validator: _validatePassword,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      suffixIcon: IconButton(
                        onPressed: _toggleObscureText,
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hintText: 'Enter Your Password',
                      hintStyle: const TextStyle(fontFamily: Fonts.poppins),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide:
                            BorderSide(color: AppColors.black, width: 1.5),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: _toggleRememberMe,
                        ),
                        InkWell(
                          onTap: () {
                            _toggleRememberMe(!_rememberMe);
                          },
                          child: const TextWidget(
                            text: 'Remember Me',
                            fontsize: 15,
                            fontfamily: Fonts.poppins,
                            fontweight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const TextWidget(
                        text: 'Forgot Password?', color: AppColors.red),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  logo: const Text(''),
                  color: _isButtonEnabled
                      ? AppColors.royalBlue
                      : AppColors.davisGrey,
                  txtcolor: AppColors.white,
                  buttonName: 'Login',
                  onTap: () {
                    _isButtonEnabled ? () {} : null;
                  },
                ),
                const SizedBox(height: 76),
                Image.asset(Images.line),
                const SizedBox(height: 33),
                CustomButton(
                  color: AppColors.royalBlue,
                  txtcolor: AppColors.white,
                  logo: Image.asset(Images.facebook),
                  buttonName: 'Login with Facebook',
                ),
                const SizedBox(height: 21),
                CustomButton(
                  txtcolor: AppColors.featherGrey,
                  border: Border.all(width: 1),
                  color: AppColors.white,
                  logo: Image.asset(Images.google),
                  buttonName: 'Login with Google',
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: 'Don’t have an account? ',
                      fontsize: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()),
                        );
                      },
                      child: const TextWidget(
                        text: 'Sign Up',
                        fontsize: 16,
                        color: AppColors.darkBlue,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 39),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
