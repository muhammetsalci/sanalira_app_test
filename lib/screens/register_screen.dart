import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanalira_flutter_test/screens/bank_list_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool? isChecked = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 41, 55),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 34, 41, 55).withOpacity(0.2),
                BlendMode.dstATop),
            image: const AssetImage("assets/register_screen_icon/registerBackground.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(top: 50.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/register_screen_icon/sanaliraLogo.png",
                      height: 64.h,
                    ),
                    SizedBox(
                      width: 25.w,
                    ),
                    Text("SanaLira",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 25.sp)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: Container(
                padding: EdgeInsets.all(16.0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.w),
                      topRight: Radius.circular(40.w)),
                  color: const Color.fromARGB(255, 34, 41, 55).withAlpha(230),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("SanaLira'ya ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor)),
                          Text(
                            "Yeni Üyelik",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Bilgilerinizi girip sözleşmeyi onaylayın.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 13.sp),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 2.h),
                                child: Text(
                                  "Ad",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              _buildNameField(context),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 2.h),
                                child: Text(
                                  "Soyad",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              _buildLastNameField(context),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 2.h),
                                child: Text(
                                  "E-Posta",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              _buildEmailField(context),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 2.h),
                                child: Text(
                                  "Şifre",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              _buildPasswordField(context),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 2.h),
                                child: Text(
                                  "Cep Telefonu Numaranız",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              _buildPhoneNumberField(context),
                              _buildCheck(context),
                              _buildRegisterButton(context),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: Colors.white, width: 1.w),
      ),
      child: TextFormField(
        //İsim
        keyboardType: TextInputType.text,
        onSaved: (input) {},
        validator: (input) {
          if (input!.length < 3 || input.length > 50) {
            return "İsim 3 karakterden küçük, 50 karakterden büyük olamaz!";
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: "Eşref IBAN",
        ),
        style: Theme.of(context).textTheme.bodyText1,
        controller: _firstNameController,
      ),
    );
  }

  Widget _buildLastNameField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: Colors.white, width: 1.w)),
      child: TextFormField(
        //İsim
        keyboardType: TextInputType.text,
        onSaved: (input) {},
        validator: (input) {
          if (input!.length < 3 || input.length > 50) {
            return "Soyisim 3 karakterden küçük, 50 karakterden büyük olamaz!";
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: "Yaşa",
        ),
        style: Theme.of(context).textTheme.bodyText1,
        controller: _lastNameController,
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: Colors.white, width: 1.w)),
      child: TextFormField(
        //İsim
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) {},
        validator: (input) =>
            !input!.contains("@") ? "Geçersiz E-mail !" : null,
        decoration: const InputDecoration(
          hintText: "esrefyasa@monegon.com",
        ),
        style: Theme.of(context).textTheme.bodyText1,
        controller: _emailAddressController,
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: Colors.white, width: 1.w)),
      child: TextFormField(
        //İsim
        keyboardType: TextInputType.text,
        obscureText: true,
        onSaved: (input) {},
        validator: (input) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,50}$');
          if (regex.hasMatch(input!)) {
            return null;
          } else {
            return "Şifre gerekli koşulları sağlamıyor.";
          }
        },
        decoration: const InputDecoration(
          hintText: "********",
        ),
        style: Theme.of(context).textTheme.bodyText1,
        controller: _passwordController,
      ),
    );
  }

  Widget _buildPhoneNumberField(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(minWidth: 75.w, maxWidth: 75.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1.w)),
          child: TextFormField(
            readOnly: true,
            decoration: const InputDecoration(
              hintText: "   +90",
            ),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8.w),
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 115.w, //
              minWidth: MediaQuery.of(context).size.width / 2.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 1.w)),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "5xxxxxxxxx",
            ),
            style: Theme.of(context).textTheme.bodyText1,
            keyboardType: TextInputType.number,
            controller: _phoneNumberController,
            validator: (value) {
              if (value!.length != 10) {
                return "Eksik tuşlama yaptınız.";
              } else {
                if (value[0] != "5") {
                  return "Doğru bir telefon numarası giriniz.";
                }
                return null;
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildCheck(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Transform.scale(
          scale: 1.1.sp,
          child: Checkbox(
            side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(
                width: 1.0.w,
                color: Colors.white,
              ),
            ),
            value: isChecked,
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(Colors.white),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
        ),
        Expanded(
          child: Wrap(
            children: const [
              Text("Hesabınızı oluştururken "),
              Text(
                "sözleşme ve koşulları ",
                style: TextStyle(color: Colors.green),
              ),
              Text("kabul etmeniz gerekir.")
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.green,
        minWidth: double.infinity,
        height: 40.h,
        child: Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate() && isChecked == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BankListScreen(),
              ),
            );
          }
        });
  }
}
