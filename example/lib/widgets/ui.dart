import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class UiExamples extends StatefulWidget {
  const UiExamples({super.key});

  @override
  State<UiExamples> createState() => _UiExamplesState();
}

class _UiExamplesState extends State<UiExamples> {
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: 24.px,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            UiTextField(
              controller: controller,
              borderColor: context.brandPrimary,
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
            UiTextField(
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
            UiTextField(
              //label: 'Username',
              hintText: 'Enter your username',

              prefixIcon: Icon(Icons.person_outline),
              controller: null,
            ),
             SizedBox(height: 16.h),
            Center(
              child: UiOtpField(
                pinLength: 4,
                fieldSize: 56,
                fieldGap: 12,
                autoSubmit: true,
                onCompleted: (otp) {
                  // Handle OTP verification
                  print('OTP entered: $otp');
                },
                onResend: () {
                  // Handle resend logic
                  print('Resend OTP requested');
                },
                decoration: const OtpDecoration(
                  borderRadius: 12,
                  focusBorderColor: Colors.blue,
                  successBorderColor: Colors.green,
                  errorBorderColor: Colors.red,
                ),
                resendButtonBuilder: (context, onResend, seconds, isEnabled) {
                  return isEnabled
                      ? TextButton(
                          onPressed: onResend,
                          child: const Text('Resend OTP'),
                        )
                      : Text('Resend available in $seconds seconds');
                },
              ),
            ),

            UiButton(
              label: "Continue",
              icon: Icon(Icons.arrow_forward),
              onPressed: () {},
              //padding: 16.px + 18.py,
              backgroundColor: context.brandPrimary,
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
                  foregroundColor: context.brandPrimary,
                ),
                8.s,
                UiButton.icon(icon: Icon(Icons.add), onPressed: () {}),
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
              errorText: selectedGender.isEmpty
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
