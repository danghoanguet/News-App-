import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/user.dart';
import 'package:getx_clean_base/src/presentation/pages/sign_in/controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build run');
    final SignInController _controller = Get.put(SignInController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: _controller.unFocus,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://visme.co/blog/wp-content/uploads/2017/07/50-Beautiful-and-Minimalist-Presentation-Backgrounds-05.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    Obx(() => _controller.isSignUp.value
                        ? TextFormField(
                            focusNode: _controller.userNameFocusNode.value,
                            controller: _controller.userNameController.value,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              label: const Text("User name"),
                              suffixIcon: _controller.userNameSuffixIcon(),
                            ),
                            validator: _controller.userNameValidator,
                            onChanged: (_) => {
                              _controller.onChange()
                              // _controller.isSignUp.value  ? _controller.signUp() : _controller.logIn()
                            },
                          )
                        : const SizedBox()),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        focusNode: _controller.emailFocusNode.value,
                        controller: _controller.emailController.value,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          suffixIcon: _controller.emailSuffixIcon(),
                        ),
                        validator: _controller.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => {_controller.onChange()},
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TextFormField(
                        focusNode: _controller.passwordFocusNode.value,

                        controller: _controller.passwordController.value,
                        obscureText: _controller.isObscureText.value,
                        decoration: InputDecoration(
                            suffixIcon: _controller.passwordSuffixIcon(),
                            label: const Text('Password')),
                        onEditingComplete: _controller.isSignUp.value
                            ? _controller.signUp
                            : _controller.logIn,
                        validator: _controller.passwordValidator,
                        onChanged: (value) => _controller.onChange(),
                        //validator: _controller.passwordValidator,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => _controller.isSignUp.value
                              ? _controller.signUp()
                              : _controller.logIn(),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: Text(
                            _controller.isSignUp.value ? 'Sign up' : 'Log in',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              _controller.isSignUp.value
                                  ? 'Already have an account?'
                                  : 'Don\'t have an account?',
                              style: const TextStyle(
                                fontSize: 15,
                              )),
                          const SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: _controller.toggleSignUp,
                            child: Text(
                              _controller.isSignUp.value
                                  ? 'Login now'
                                  : 'Sign up now',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightGreen),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
