import 'package:budupdated/views/sign_up_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // used to test that if user enters empty string it should return enter email address message
  test("empty mails returns error string", () {
    var result = EmailFieldValidator.validate('');
    expect(result, "Enter email address");
  });

  // this t is used to test also the validation of the text entered by the user so if the user enter email the expected returned result is null
  test("valid emails returns null", () {
    var result = EmailFieldValidator.validate('mohab.magdy1@msa.edu.eg');
    expect(result, null);
  });

  // non valid emails returns Email is not valid we test by example of non valid email
  test("non valid emails return email is not valid", () {
    var result = EmailFieldValidator.validate('mohab.magdy1@msa');
    expect(result, "Email is not valid");
  });

  // in this test we test that if user enters empty password he should see password must be up to 6 characters
  test("empty passwords returns error string", () {
    var result = PasswordFieldValidatr.validatePassword('');
    expect(result, "Password must be up to 6 characters");
  });

  test(" 6 digits password returns null", () {
    var result = PasswordFieldValidatr.validatePassword('123456');
    expect(result, null);
  });

  test(
      " less than 6 digits password returns Password must be up to 6 characters",
      () {
    var result = PasswordFieldValidatr.validatePassword('1');
    expect(result, "Password must be up to 6 characters");
  });
}
