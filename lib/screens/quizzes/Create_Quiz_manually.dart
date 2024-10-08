import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final TextEditingController _formTitleController = TextEditingController();
  final TextEditingController _formDescriptionController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _questionType = 'Short Answer';
  List<String> _multipleChoices = [];
  String? _correctAnswer;
  List<Map<String, dynamic>> questions = [];
  bool collectEmail = false;
  bool limitResponses = false;
  int timePerQuestion = 5;
  bool isLoading = false;

  // Adjusted colors to match your app's theme
  final Color primaryColor = Color(0xFF9C27B0); // Dark Purple
  final Color secondaryColor = Color(0xFF03A9F4); // Light Blue
  final Color accentColor = Color(0xFFFFCC00); // Yellow
  final Color textColor = Colors.white;

  void _addQuestion() {
    if (_questionController.text.isNotEmpty) {
      setState(() {
        questions.add({
          'text': _questionController.text,
          'type': _questionType,
          'options': _questionType == 'Multiple Choice' ? List.from(_multipleChoices) : [],
          'correctAnswer': _correctAnswer,
        });
        _questionController.clear();
        _multipleChoices.clear();
        _correctAnswer = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Question cannot be empty!')),
      );
    }
  }

  Future<void> _createQuiz() async {
    if (_formTitleController.text.isEmpty || questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz title and at least one question are required.')),
      );
      return;
    }

    final currentUser = _auth.currentUser; // Get the current user

    final quizData = {
      'title': _formTitleController.text,
      'description': _formDescriptionController.text,
      'questions': questions,
      'collectEmail': collectEmail,
      'limitResponses': limitResponses,
      'timePerQuestion': timePerQuestion,
      'created_at': FieldValue.serverTimestamp(),
      'createdBy': currentUser?.uid, // Store the user's ID here
      'creationMethod': 'manually', // Store the creation method as "manually"
    };

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('quizzes').add(quizData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz created successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating quiz: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create a Quiz",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuizDetailsSection(),
            const SizedBox(height: 20),
            _buildQuestionSection(),
            const SizedBox(height: 20),
            _buildAddedQuestionsList(),
            const SizedBox(height: 20),
            _buildFormSettings(),
            const SizedBox(height: 20),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Create a New Quiz",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        const SizedBox(height: 16),
        _buildTextField(_formTitleController, 'Quiz Title'),
        const SizedBox(height: 16),
        _buildTextField(_formDescriptionController, 'Quiz Description'),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: secondaryColor.withOpacity(0.1),
      ),
    );
  }

  Widget _buildQuestionSection() {
    final TextEditingController optionController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Add Questions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
        const SizedBox(height: 10),
        _buildTextField(_questionController, 'Question'),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: _questionType,
          items: ['Short Answer', 'Paragraph', 'Multiple Choice'].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
          onChanged: (value) {
            setState(() {
              _questionType = value!;
            });
          },
        ),
        if (_questionType == 'Multiple Choice') ...[
          _buildTextField(optionController, 'Option'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: accentColor),
            onPressed: () {
              setState(() {
                if (optionController.text.isNotEmpty) {
                  _multipleChoices.add(optionController.text);
                  optionController.clear();
                }
              });
            },
            child: const Text("Add Option"),
          ),
          Wrap(
            spacing: 6,
            children: _multipleChoices
                .map((option) => Chip(
              label: Text(option),
              backgroundColor: accentColor.withOpacity(0.2),
              deleteIconColor: primaryColor,
              onDeleted: () {
                setState(() {
                  _multipleChoices.remove(option);
                });
              },
            ))
                .toList(),
          ),
          DropdownButton<String>(
            hint: const Text("Select Correct Answer"),
            value: _correctAnswer,
            items: _multipleChoices.map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
            onChanged: (value) {
              setState(() {
                _correctAnswer = value;
              });
            },
          ),
        ],
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: _addQuestion,
          child: const Text("Add Question", style: TextStyle(color: Colors.white)),
        ),

      ],
    );
  }

  Widget _buildAddedQuestionsList() {
    return Column(
      children: questions
          .map((question) => ListTile(
        tileColor: secondaryColor.withOpacity(0.1),
        title: Text(question['text'], style: TextStyle(color: primaryColor)),
        subtitle: Text("Type: ${question['type']}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              questions.remove(question);
            });
          },
        ),
      ))
          .toList(),
    );
  }

  Widget _buildFormSettings() {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: primaryColor,
          title: const Text("Collect Email Addresses"),
          value: collectEmail,
          onChanged: (value) {
            setState(() {
              collectEmail = value!;
            });
          },
        ),
        CheckboxListTile(
          activeColor: primaryColor,
          title: const Text("Limit Responses"),
          value: limitResponses,
          onChanged: (value) {
            setState(() {
              limitResponses = value!;
            });
          },
        ),
        Row(
          children: [
            const Text("Time per question (seconds):"),
            const SizedBox(width: 10),
            DropdownButton<int>(
              value: timePerQuestion,
              items: [5, 10, 15, 20, 30, 60].map((time) => DropdownMenuItem(value: time, child: Text("$time"))).toList(),
              onChanged: (value) {
                setState(() {
                  timePerQuestion = value!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: _createQuiz,
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : const Text("Create Quiz", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
