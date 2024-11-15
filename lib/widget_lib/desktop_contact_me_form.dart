import 'package:flutter/material.dart';
import 'package:portfolio_page/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopContactMeForm extends StatefulWidget {
  const DesktopContactMeForm({super.key});

  @override
  State<DesktopContactMeForm> createState() => _DesktopContactMeFormState();
}

class _DesktopContactMeFormState extends State<DesktopContactMeForm> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    int maxLines = 10;
    double formWidth,
        seperatorWidth = 20,
        submitSize,
        buttonSeperatorHeight = 60,
        buttonWidth;
    final RegExp mailExp =
        RegExp(r'^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$');

    if (540 <= screenWidth && screenWidth <= 1024) {
      formWidth = 400;
      buttonSeperatorHeight = 40;
      buttonWidth = formWidth * 0.3;
      submitSize = 15;
    } else if (1024 < screenWidth && screenWidth <= 1200) {
      formWidth = 500;
      buttonWidth = formWidth * 0.2;
      submitSize = 20;
    } else {
      formWidth = 700;
      seperatorWidth = 40;
      maxLines = 12;
      buttonWidth = formWidth * 0.2;
      submitSize = 20;
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: (formWidth - seperatorWidth) / 2,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Name',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: colorScheme.onPrimary,
                    filled: true,
                    contentPadding: EdgeInsets.all(10)),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
            ),
            SizedBox(width: seperatorWidth),
            SizedBox(
              width: (formWidth - seperatorWidth) / 2,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: colorScheme.onPrimary,
                    filled: true,
                    contentPadding: EdgeInsets.all(10)),
                validator: (value) => mailExp.hasMatch(value ?? 'email')
                    ? null
                    : 'Enter a valid email',
              ),
            ),
          ]),
          SizedBox(
            height: seperatorWidth / 2,
          ),
          SizedBox(
            width: formWidth,
            child: TextFormField(
              controller: _feedbackController,
              maxLines: maxLines,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Message',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: colorScheme.onPrimary,
                  filled: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(height: buttonSeperatorHeight),
          ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(buttonWidth, buttonSeperatorHeight * 0.9))),
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: submitSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ink Free',
                    letterSpacing: 1),
              )),
        ],
      ),
    );
  }
}
