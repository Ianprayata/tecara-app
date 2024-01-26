import '../files.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    LoginState loginProvider = Provider.of<LoginState>(context);
    late SharedPreferences _prefs;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.0769230769,
                0,
                MediaQuery.of(context).size.width * 0.0769230769,
                0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Greetings, how are you?",
                  style: subheading.copyWith(
                    color: black,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Login to continue your journey",
                  style: smallText.copyWith(color: grey, fontWeight: regular),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 17,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  "Email address",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: black,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 18,
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Image.asset("images/email.png",
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: emailEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan alamat email anda",
                            hintStyle: smallText.copyWith(color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: black,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 18,
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Image.asset("images/pw.png",
                            width: 20, height: 20, fit: BoxFit.cover),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: passwordEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintText: "Masukkan kata sandi anda",
                            hintStyle: smallText.copyWith(color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Lupa kata sandi?",
                      style:
                          smallText.copyWith(color: purple, fontWeight: bold),
                    ),
                    onPressed: () => {},
                  ),
                ),
                Center(
                  child: loginProvider.isPressed
                      ? const CircularProgressIndicator(color: purple)
                      : Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width *
                                  0.0769230769),
                          child: ElevatedButton(
                            onPressed: () async {
                              loginProvider.pressButton = true;
                              if (emailEditingController.text == "" ||
                                  passwordEditingController.text == "") {
                                loginProvider.pressButton = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: heavyRed,
                                    content: Text(
                                      'Mohon isi seluruh bagian',
                                      style: regularText.copyWith(
                                        color: white,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                );
                              } else if (emailEditingController.text
                                      .contains("@") !=
                                  true) {
                                loginProvider.pressButton = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: heavyRed,
                                    content: Text(
                                      'Mohon isi email dengan benar',
                                      style: regularText.copyWith(
                                        color: white,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                User? userCred = await authService.login(
                                    emailEditingController.text,
                                    passwordEditingController.text,
                                    context);

                                if (userCred == null) {
                                  loginProvider.pressButton = false;
                                } else {
                                  Navigator.pushNamed(context, "/nav-bar");
                                  
                                  loginProvider.pressButton = false;
                                }
                                debugPrint(userCred.toString());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.3,
                                  vertical: 15),
                              backgroundColor: purple,
                              alignment: Alignment.center,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: mediumText.copyWith(
                                  fontWeight: semiBold, color: white),
                            ),
                          ),
                        ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Don't have an account?",
                                style: regularText.copyWith(
                                    color: grey, fontWeight: regular)),
                            TextSpan(
                                text: " Sign Up",
                                style: regularText.copyWith(
                                    color: purple, fontWeight: semiBold))
                          ],
                        ),
                      ),
                      onPressed: () => Navigator.pushNamed(context, "/signup"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
