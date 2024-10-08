import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_ai/screens/auth/register_screen.dart';
import '../navigation/bottom_navigation.dart';
import 'forgot_password.dart'; // Import HomePage

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isPasswordVisible = false;
  bool _isLoading = false; // Loading state variable

  // Method to handle Google Sign-In
  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true; // Set loading to true
    });
    try {
      await _googleSignIn.signOut(); // Ensures a clean login
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        await _saveUserInfo(userCredential.user!.uid, userCredential.user!.email!);

        _showLoginSuccessMessage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      _showErrorDialog('Google Sign-In failed: $error');
    } finally {
      setState(() {
        _isLoading = false; // Set loading to false
      });
    }
  }

  // Method to handle Facebook Sign-In
  Future<void> _handleFacebookSignIn() async {
    setState(() {
      _isLoading = true; // Set loading to true
    });
    try {
      await FacebookAuth.instance.logOut(); // Ensures a clean login
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(result.accessToken! as String);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        await _saveUserInfo(userCredential.user!.uid, userCredential.user!.email!);

        _showLoginSuccessMessage();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      _showErrorDialog('Facebook Sign-In failed: $error');
    } finally {
      setState(() {
        _isLoading = false; // Set loading to false
      });
    }
  }

  // Method to handle Email Sign-In with Firebase
  Future<void> _handleEmailSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Set loading to true
      });
      try {
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        User? user = userCredential.user;

        if (user != null) {
          if (!user.emailVerified) {
            await FirebaseAuth.instance.signOut();
            _showErrorDialog('Please verify your email before logging in.');
            return;
          }

          await _updateLastLogin(user.uid);
          _showLoginSuccessMessage();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } catch (error) {
        _showErrorDialog('Invalid email or password. Please try again.');
      } finally {
        setState(() {
          _isLoading = false; // Set loading to false
        });
      }
    }
  }


// Method to save user information to Firestore
  Future<void> _saveUserInfo(String uid, String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'last_login': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // Merge to avoid overwriting existing data
    } catch (e) {
      _showErrorDialog('Failed to save user info: $e');
    }
  }

// Method to update the last login timestamp in Firestore
  Future<void> _updateLastLogin(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'last_login': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      _showErrorDialog('Failed to update last login: $e');
    }
  }


  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Show success message after login
  void _showLoginSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login successful!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Increase font size
            fontWeight: FontWeight.bold, // Make it bold
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: _isLoading // Show loading indicator if loading
              ? Center(child: CircularProgressIndicator())
              : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9C27B0),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Please log in to continue.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),

                // Email text field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade300),
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.purple),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password text field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade300),
                    ),
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.purple),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Forgot Password button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF9C27B0),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Login button
                // Login button
                ElevatedButton(
                  onPressed: _handleEmailSignIn,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFF9C27B0), // Use your primary color
                    elevation: 5, // Add elevation for a shadow effect
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Add space between buttons

// Register button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.grey.shade300, // A lighter color
                    elevation: 0, // No shadow for this button
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold, // Make text bold
                      letterSpacing: 1.5, // Add letter spacing for attractiveness
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Add space between buttons


                // Or continue with social login text
                Center(
                  child: const Text(
                    'Or continue with',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: _handleGoogleSignIn,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 1.5), // Subtle border
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white, // Clean white background
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12), // Slightly increased padding
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Image(
                              image: AssetImage('assets/google.png'),
                              height: 24, // Slightly larger for better visibility
                            ),
                            SizedBox(width: 10),
                            Text(
                              '  Google  ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600, // Slightly bolder for emphasis
                                color: Colors.black, // Dark text for professionalism
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _handleFacebookSignIn,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300, width: 1.5), // Subtle border
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white, // Clean white background
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12), // Slightly increased padding
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Image(
                              image: AssetImage('assets/facebook.png'),
                              height: 24, // Slightly larger for better visibility
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600, // Slightly bolder for emphasis
                                color: Colors.black, // Dark text for professionalism
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
