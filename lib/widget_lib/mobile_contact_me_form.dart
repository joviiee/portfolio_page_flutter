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

  Future<void> _submitForm() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (_formKey.currentState!.validate()) {
      // Construct the Gmail compose URL
      final String email = 'abgvb1215@gmail.com';
      final String subject =
          Uri.encodeComponent('Feedback from ${_nameController.text}');
      final String body = Uri.encodeComponent('Name: ${_nameController.text}\n'
          'Email: ${_emailController.text}\n'
          'Feedback: ${_feedbackController.text}');

      final String url =
          'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=$email&su=$subject&body=$body';
      final Uri emailUri = Uri.parse(url);

      // Attempt to launch the URL
      if (await launchUrl(emailUri)) {
        scaffoldMessenger
            .showSnackBar(SnackBar(content: Text("Redirecting to mail app")));
      } else {
        scaffoldMessenger.showSnackBar(
            SnackBar(content: Text("Could not load resume at the moment")));
      }
    } else {
      scaffoldMessenger
          .showSnackBar(SnackBar(content: Text("Could not validate the form")));
    }
  }

  @override
  Widget build(BuildContext context) {

    int maxLines = 7;
    double formWidth = 300;
    double buttonSeperatorHeight = 40;
    double buttonWidth = formWidth * 0.3;
    final RegExp mailExp =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');

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
              validator: (value) => mailExp.hasMatch(value ?? "email")
                  ? null
                  : 'Enter a valid email',
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
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(buttonWidth, buttonSeperatorHeight * 0.8))),
              child: Text(
                'Submit',
                style: TextStyle(
                    fontFamily: 'Ink Free',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )),
        ],
      ),
    );
  }
}
