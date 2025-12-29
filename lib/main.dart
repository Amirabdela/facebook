import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Login Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF1877F2), // Facebook blue
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _isLoggingIn = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() => _isLoggingIn = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoggingIn = false);
    // For this clone, just show a snackbar as a placeholder
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Logging in as ${_emailCtrl.text}')));
  }

  @override
  Widget build(BuildContext context) {
    final fbBlue = const Color(0xFF1877F2);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: fbBlue,
                padding: const EdgeInsets.symmetric(vertical: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'f',
                          style: TextStyle(
                            color: fbBlue,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            TextField(
                              controller: _emailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email or phone number',
                                border: InputBorder.none,
                              ),
                            ),
                            const Divider(height: 1),
                            TextField(
                              controller: _passCtrl,
                              obscureText: _obscure,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () =>
                                      setState(() => _obscure = !_obscure),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: fbBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                                onPressed: _isLoggingIn ? null : _login,
                                child: _isLoggingIn
                                    ? SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Text(
                                        'Log In',
                                        style: TextStyle(fontSize: 16),
                                      ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgotten password?',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: fbBlue),
                          backgroundColor: fbBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Create new account',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Create a Page for a celebrity, band or business',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
