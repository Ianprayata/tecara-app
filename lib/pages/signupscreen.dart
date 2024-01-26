import '../files.dart';

class SignUpScreen extends StatelessWidget {
  final fullnameEditingController = TextEditingController();
  final usernameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final instanceEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmpwEditingController = TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.popAndPushNamed(context, '/login'),
                  child: Image.asset(
                    "images/arrow_back.png",
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 15),
                Text("Create an account",
                    style: subheading.copyWith(
                        color: black, fontWeight: semiBold)),
                Text("Daftarkan diri anda dan jadi bagian dari kami",
                    style:
                        regularText.copyWith(color: grey, fontWeight: regular)),
                SizedBox(height: MediaQuery.of(context).size.height * 40 / 844),
                Text(
                  "Nama lengkap",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                        child: Image.asset("images/username.png",
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: fullnameEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan nama lengkap anda",
                            hintStyle: smallText.copyWith(color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Username",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                        child: Image.asset("images/fullname.png",
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: usernameEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan username yang anda inginkan",
                            hintStyle: smallText.copyWith(
                              color: grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Alamat email",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                Text(
                  "Instansi",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                        child: Image.asset("images/educon_unfilled.png",
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: instanceEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan instansi anda",
                            hintStyle: smallText.copyWith(color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Kata sandi",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: passwordEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan kata sandi anda",
                            hintStyle: smallText.copyWith(color: grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Konfirmasi kata sandi",
                  style: regularText.copyWith(
                    color: black,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  margin: const EdgeInsets.only(bottom: 20),
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
                            fit: BoxFit.cover, width: 20, height: 20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: confirmpwEditingController,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Masukkan ulang kata sandi anda",
                            hintStyle: smallText.copyWith(
                                color: grey, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.846153846,
                  height: MediaQuery.of(context).size.height / 18,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (emailEditingController.text == '' ||
                          usernameEditingController.text == "" ||
                          fullnameEditingController.text == "" ||
                          instanceEditingController.text == "" ||
                          passwordEditingController.text == "" ||
                          confirmpwEditingController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: heavyRed,
                            content: Text(
                              'Seluruh bagian harus diisi',
                              style: regularText.copyWith(
                                color: white,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        );
                      } else if (emailEditingController.text.contains("@") !=
                          true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
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
                      } else if (confirmpwEditingController.text !=
                          passwordEditingController.text) {
                        SnackBar(
                          backgroundColor: heavyRed,
                          content: Text(
                            'Password tidak sesuai',
                            style: regularText.copyWith(
                              color: white,
                              fontWeight: semiBold,
                            ),
                          ),
                        );
                      } else {
                        try {
                          Navigator.pop(context);
                          User? userAuth = await authService.register(context,
                              email: emailEditingController.text,
                              password: passwordEditingController.text,
                              username: usernameEditingController.text,
                              fullname: fullnameEditingController.text,
                              instance: instanceEditingController.text,
                              user: "Student");

                          debugPrint(userAuth.toString());
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        backgroundColor: purple),
                    child: Text(
                      "Continue",
                      style: mediumText.copyWith(
                        color: white,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 15),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.846153846,
                //   height: MediaQuery.of(context).size.height / 18,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //         alignment: Alignment.center,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         elevation: 0,
                //         backgroundColor: subtleGrey),
                //     child: Text(
                //       "Daftar dengan nomor hp",
                //       style: mediumText.copyWith(
                //         color: purple,
                //         fontWeight: semiBold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
