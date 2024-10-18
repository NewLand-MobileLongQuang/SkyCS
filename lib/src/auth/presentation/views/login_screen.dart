import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnstd/core/common/views/loading_view.dart';
import 'package:idnstd/core/common/widgets/rounded_button.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/extensions/context_extension.dart';
import 'package:idnstd/core/res/colors.dart';
import 'package:idnstd/core/res/test_style.dart';
import 'package:idnstd/core/utils/core_utils.dart';
import 'package:idnstd/src/auth/presentation/cubit/auth_cubit.dart';
import 'package:idnstd/src/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var _isRememberMe = false;

  @override
  void initState() {
    context.read<AuthCubit>().init();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          }
          if (state is AuthSignedIn) {
            CoreUtils.showSnackBar(context, 'welcome ${state.session.user.Name} ! ${AppConfig.current().appId}');
            context.userProvider.initSession(state.session);
            Navigator.pushReplacementNamed(context, '/select-network');
          }
          if(state is AuthStateLoaded) {
            emailController.text = state.email;
            passwordController.text = state.password;
            _isRememberMe = state.rememberMe;
          }
        },
        builder: (context, state) {
          if(state is AuthStateLoading) {
            return const LoadingView();
          }
          if(state is AuthStateLoaded) {
            return SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                      'Welcome to ecore system',
                      style: AppTextStyles.textStyleInterW500S32Black
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  LoginForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        'Nhớ tài khoản',
                        style: AppTextStyles.textStyleInterW400S16Black,
                      ),
                      Checkbox(
                        value: _isRememberMe,
                        onChanged: (value) {
                          setState(() {
                            _isRememberMe = value!;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RoundedButton(
                    label: 'Sign in',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          rememberMe: _isRememberMe,
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
