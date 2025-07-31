import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class UiExamples extends StatefulWidget {
  const UiExamples({Key? key}) : super(key: key);

  @override
  State<UiExamples> createState() => _UiExamplesState();
}

class _UiExamplesState extends State<UiExamples> {
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: 24.p,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            UiTextField.filled(
              controller: _controller,
              borderColor: context.primaryColor,
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required';
                if (!value.contains('@')) return 'Enter a valid email';
                return null;
              },
            ),
            SizedBox(height: 16.h),
            UiTextField.outlined(
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
              autoFocus: false,
              maxLines: 1,
              prefixIcon: Icon(Icons.lock_outline),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Password required';
                if (value.length < 6) return 'Min 6 characters';
                return null;
              },
              controller: null,
            ),
            SizedBox(height: 16.h),
            UiTextField.borderless(
              //label: 'Username',
              hintText: 'Enter your username',

              prefixIcon: Icon(Icons.person_outline),
              controller: null,
            ),
            Center(
              child: UiOtpField(
                pinLength: 4,
                fieldWidth: 48,
                autoSubmit: true,
                decoration: const OtpDecoration(
                  borderColor: Colors.grey,
                  focusBorderColor: Colors.blue,
                  errorBorderColor: Colors.red,
                  successBorderColor: Colors.green,
                  borderRadius: 12,
                  boxColor: Color(0xFFF9F9F9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                onCompleted: (code) {
                  print('Completed: $code');
                  // Trigger API verification here
                },
                onChanged: (code) {
                  print('Changed: $code');
                },

                // boxDecoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(12),
                //   color: Colors.white,
                //   border: Border.all(color:context.primaryColor),
                // ),
                cursorColor: Colors.blue,

                resendButtonBuilder: (onTap, seconds) => UiButton.text(
                  onPressed: seconds == 0 ? onTap : null,
                  label: seconds == 0 ? 'Resend OTP' : 'Resend in ${seconds}s',
                  foregroundColor: seconds == 0 ? Colors.blue : Colors.grey,
                ),
              ),
            ),

            UiButton(
              label: "Continue",
              icon: Icon(Icons.arrow_forward),
              onPressed: () {},
              //padding: 16.px + 18.py,
              backgroundColor: context.primaryColor,
            ),
            SizedBox(height: 8.h),
            UiButton.text(label: "Forgot Password?", onPressed: () {}),
            Row(
              children: [
                UiButton.icon(icon: Icon(Icons.edit), onPressed: () {}),
                SizedBox(width: 8.w),
                UiButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                  foregroundColor: context.primaryColor,
                ),
                8.s,
                UiButton.circle(
                  size: 36.sp,
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 24.h),

            UiCheckbox(
              label: 'Accept Terms & Conditions',
              value: true,
              onChanged: (val) => {print('Checkbox changed: $val')},
              isDisabled: false,
            ),
            UiCheckbox.group(
              options: ['Singing', 'Writing', 'Photography'],
              onChanged: (updated) => {},
              errorText: selectedGender!.isEmpty
                  ? 'Please select at least one'
                  : null,
              selectedValues: ['Singing', 'Photography'],
            ),
            UiRadioButton(
              label: 'Male',
              value: 'male',
              groupValue: selectedGender,
              onChanged: (val) => setState(() => selectedGender = val),
            ),
            UiRadioButton.group(
              options: ['Male', 'Female', 'Other'],
              onChanged: (val) => setState(() => selectedGender = val),
              // ignore: unnecessary_null_comparison
              errorText: selectedGender == null ? 'Please select gender' : null,
              selectedValue: selectedGender,
              labelBuilder: (value) {
                return value.toString();
              },
            ),
            Label('Explore more components'),
            SizedBox(height: 8.h),

            UiListView.horizontal(
              itemCount: 3,
              itemBuilder: (_, index) {
                return SizedBox(
                  width: 320,
                  child: UiProductCard(
                    imageUrl:
                        'https://source.unsplash.com/100x100/?gadget,$index',
                    title: 'Product #$index',
                    subtitle: 'Top-rated gadget',
                    price: '\$${(index + 1) * 99}',
                    onTap: () {},
                    onAction: () {},
                  ),
                );
              },
            ),
            Column(
              children: [
                UiFlatButton(label: "Login", onPressed: () {}),
                SizedBox(height: 12),
                UiFlatButton.outlined(label: "Sign Up", onPressed: () {}),
                SizedBox(height: 12),
                UiFlatButton.text(label: "Forgot Password?", onPressed: () {}),
              ],
            ),
            //Bootstrap Styles
            Container(
              color: Ui.theme.primaryColor,
              child: Section(
                children: [
                  SectionItem(
                    sizes: 'lg-4 md-8 sm-12',
                    child: Text(
                      'Will take full on sm',
                      style: context.bodyLarge,
                    ),
                  ),
                  SectionItem(
                    sizes: 'lg-8 md-4 sm-0',
                    child: Text(
                      'Will take hidden on phone',
                      style: context.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).scrollable(),
      ),
    );
  }
}
