// views/signup_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoozy_pay_app/views/authentification/signin_page.dart';
import '../../ViewModel/authen/signup_viewmodel.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final padding = isSmallScreen ? 20.0 : 40.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (_) => SignUpViewModel(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Consumer<SignUpViewModel>(
                    builder: (context, viewModel, _) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up!',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 32 : 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        _buildInputField(
                          label: 'NAME',
                          hintText: 'Enter your name',
                          value: viewModel.name,
                          onChanged: viewModel.setName,
                          isSmallScreen: isSmallScreen,
                        ),
                        SizedBox(height: size.height * 0.02),
                        _buildInputField(
                          label: 'EMAIL',
                          hintText: 'Enter your email',
                          value: viewModel.email,
                          onChanged: viewModel.setEmail,
                          isSmallScreen: isSmallScreen,
                        ),
                        SizedBox(height: size.height * 0.02),
                        _buildInputField(
                          label: 'PASSWORD',
                          hintText: 'Enter your password',
                          value: viewModel.password,
                          onChanged: viewModel.setPassword,
                          isPassword: true,
                          showPassword: viewModel.showPassword,
                          togglePassword: viewModel.togglePasswordVisibility,
                          isSmallScreen: isSmallScreen,
                        ),
                        SizedBox(height: size.height * 0.02),
                        _buildInputField(
                          label: 'CONFIRM PASSWORD',
                          hintText: 'Confirm your password',
                          value: viewModel.confirmPassword,
                          onChanged: viewModel.setConfirmPassword,
                          isPassword: true,
                          showPassword: viewModel.showConfirmPassword,
                          togglePassword: viewModel.toggleConfirmPasswordVisibility,
                          isSmallScreen: isSmallScreen,
                        ),
                        SizedBox(height: size.height * 0.04),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: viewModel.isValid && !viewModel.isLoading
                                ? viewModel.signUp
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[600],
                              padding: EdgeInsets.symmetric(
                                vertical: isSmallScreen ? 15 : 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: viewModel.isLoading
                                ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                                : const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to sign in page
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>const SignInPage()),);

                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: isSmallScreen ? 12 : 14,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        Center(
                          child: Text(
                            'Log in with social networks',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: isSmallScreen ? 12 : 14,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(Icons.facebook),
                            SizedBox(width: size.width * 0.05),
                            _socialButton(Icons.flutter_dash),
                            SizedBox(width: size.width * 0.05),
                            _socialButton(Icons.g_mobiledata),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required String value,
    required Function(String) onChanged,
    required bool isSmallScreen,
    bool isPassword = false,
    bool showPassword = false,
    VoidCallback? togglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isSmallScreen ? 12 : 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword && !showPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: isSmallScreen ? 14 : 16,
            ),
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: togglePassword,
            )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Icon(icon, color: Colors.grey[600]),
    );
  }
}