import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandogh/data/repo/auth_repository.dart';
import 'package:sandogh/ui/auth/bloc/auth_bloc.dart';
import 'package:sandogh/ui/layout.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final TextEditingController _usernameController =
      TextEditingController(text: '09000000001');
  final TextEditingController _passwordController =
      TextEditingController(text: 'admin');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        final bloc = AuthBloc(authRepository);
        bloc.stream.listen((state) {
          if (state is AuthSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Directionality(
                  textDirection: TextDirection.rtl, child: SiteLayout()),
            ));
          }
        });
        return bloc;
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: themeData.colorScheme.background,
              body: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10,
                        vertical: 32),
                    child: Column(
                      children: [
                        Text(
                          'ورود به حساب کاربری',
                          style: themeData.textTheme.titleLarge!
                              .copyWith(fontSize: 26),
                        ),
                        SizedBox(
                          height: state is AuthError ? 30 : 38,
                        ),
                        TextField(
                            controller: _usernameController,
                            decoration:
                                const InputDecoration(hintText: 'نام کاربری')),
                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(hintText: 'رمز عبور')),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthButtonClicked(_usernameController.text,
                                    _passwordController.text));
                          },
                          style: const ButtonStyle(
                              minimumSize: MaterialStatePropertyAll(
                                  Size(double.infinity, 60))),
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'ورود',
                                  style: themeData.textTheme.titleLarge!
                                      .copyWith(
                                          fontSize: 16, color: Colors.white),
                                ),
                        ),
                        Text(
                          state is AuthError ? 'خطای نامشخص' : '',
                          style: themeData.textTheme.bodyMedium!
                              .copyWith(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
