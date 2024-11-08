import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileContactMeForm extends StatefulWidget {
  const MobileContactMeForm({super.key});

  @override
  State<MobileContactMeForm> createState() => _MobileContactMeFormState();
}

class _MobileContactMeFormState extends State<MobileContactMeForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'your_email@example.com', // Replace with your email
        queryParameters: {
          'subject': 'Feedback from ${_nameController.text}',
          'body': 'Name: ${_nameController.text}\n'
              'Email: ${_emailController.text}\n'
              'Feedback: ${_feedbackController.text}'
        },
      );
      launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    int maxLines = 7;
    double formWidth = 300;
    double seperatorHeight = 10;
    double buttonSeperatorHeight = 40;
    double buttonWidth = formWidth * 0.3;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: formWidth,
            height: 60,
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Name',
                  labelStyle: TextStyle(fontSize: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorScheme.onPrimary,
                  errorStyle: TextStyle(color: colorScheme.error),
                  filled: true,
                  helperText: ' ',
                  helperStyle: TextStyle(fontSize: 10),
                  contentPadding: EdgeInsets.all(6)),
              style: TextStyle(fontSize: 12),
              validator: (value) => value!.isEmpty ? 'Enter your name' : null,
            ),
          ),
          SizedBox(
            width: formWidth,
            height: 60,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 12),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorScheme.onPrimary,
                  filled: true,
                  helperText: ' ',
                  helperStyle: TextStyle(fontSize: 10),
                  errorStyle: TextStyle(color: colorScheme.error),
                  contentPadding: EdgeInsets.all(6)),
              style: TextStyle(fontSize: 12),
              validator: (value) =>
                  value!.contains('@') ? null : 'Enter a valid email',
            ),
          ),
          SizedBox(
            width: formWidth,
            child: TextFormField(
              controller: _feedbackController,
              maxLines: maxLines,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Message',
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorScheme.onPrimary,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: buttonSeperatorHeight),
          ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 10),
              ),
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(buttonWidth, buttonSeperatorHeight * 0.8)))),
        ],
      ),
    );
  }
}
