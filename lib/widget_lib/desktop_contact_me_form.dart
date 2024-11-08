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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'abgvb1215@gmail.com', // Replace with your email
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

    dynamic formWidth,
        seperatorWidth = 20,
        maxLines = 10,
        buttonSeperatorHeight = 60,
        buttonHeight,
        buttonWidth;

    if (540 <= screenWidth && screenWidth <= 1024) {
      formWidth = 400;
      buttonSeperatorHeight = 40;
      buttonWidth = formWidth * 0.3;
    } else if (1024 < screenWidth && screenWidth <= 1200) {
      formWidth = 500;
      buttonWidth = formWidth * 0.2;
    } else {
      formWidth = 700;
      seperatorWidth = 40;
      maxLines = 12;
      buttonWidth = formWidth * 0.2;
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
                validator: (value) =>
                    value!.contains('@') ? null : 'Enter a valid email',
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
              child: Text(
                'Submit',
                // style: TextStyle(fontSize: screenWidth < 1000 ? 10 : 20),
              ),
              style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                      Size(buttonWidth, buttonSeperatorHeight * 0.8)))),
        ],
      ),
    );
  }
}
