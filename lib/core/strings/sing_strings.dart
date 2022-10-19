const String HINT_EMAIL = "Enter your email";
const String EMAIL = "Email";
const String ENTER_EMAIL = 'Please enter your email';
const String ERROR_EMAIL = "Please enter correct email";
const String ENTER_PASSWORD = "Please enter your password";
const String LENGHT_PASS_LESS = "Please enter length password greater than 8";
const String HINT_PASS = "Enter your Password";
const String PASSWORD = "Password";
const String TITLE = "Sing In";
const String SING_UP_LINK = "create a account...";
const String CHECK_INTERNET = "check your internet ....";
const String WRONG_PASS = "you enter wrong password";
const String USER_NOT_FOUND =
    "you not have account please create a account first";
const String ERROR = "occur error unknow";
const String VERIFY_EMAIL = "verify email";
const String RE_VERIFY_EMAIL = "resend link";
const String TOO_MANY_RQT = "please try later.....";
String verifyEmailStr(email) =>
    "<p>if you have this email <mark>$email</mark> Please verify your email first to sing in</p>";

String reVerifyEmailStr(email) =>
    "<p>if you have this email <mark>$email</mark> Please verify your email first to sing in</p><span>we sended url verification link check your email ..</apan>";
