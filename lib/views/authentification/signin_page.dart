// views/signin_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoozy_pay_app/views/authentification/signup_page.dart';
import '../../ViewModel/authen/signin_viewmodel.dart';
import '../dashboard/dashboard_screen.dart';
import '../dashboard/main_dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => SignInViewModel(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Consumer<SignInViewModel>(
                  builder: (context, viewModel, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Welcome to\nSpoozy Pay!',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 28 : 32,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      _buildTextField(
                        label: 'EMAIL',
                        value: viewModel.email,
                        onChanged: viewModel.setEmail,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: size.height * 0.02),
                      _buildTextField(
                        label: 'PASSWORD',
                        value: viewModel.password,
                        onChanged: viewModel.setPassword,
                        isPassword: true,
                        isSmallScreen: isSmallScreen,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: viewModel.rememberMe,
                                onChanged: (value) =>
                                    viewModel.setRememberMe(value ?? false),
                                activeColor: Colors.blue,
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lost your password?',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 12 : 14,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          //onPressed: viewModel.isLoading ? null : viewModel.signIn,
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>MainDashboard()),);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                              vertical: isSmallScreen ? 15 : 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: viewModel.isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                            'Sign In',
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>const SignUpPage()),);

                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'No account? ',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: isSmallScreen ? 12 : 14,
                              ),
                              children: const [
                                TextSpan(
                                  text: 'Register now',
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
                          _socialButton(icon: Icons.facebook),
                          SizedBox(width: size.width * 0.05),
                          _socialButton(icon: Icons.flutter_dash),
                          SizedBox(width: size.width * 0.05),
                          _socialButton(icon: Icons.g_mobiledata),
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
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
    bool isPassword = false,
    required bool isSmallScreen,
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
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? const Icon(Icons.visibility_off, color: Colors.grey)
                : const Icon(Icons.check, color: Colors.green),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton({required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Icon(icon, color: Colors.grey[600]),
    );
  }
}