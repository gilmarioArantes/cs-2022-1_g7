import 'package:construcaosoftware/controller/login/controller_login.dart';
import 'package:construcaosoftware/model/Usuario.dart';
import 'package:construcaosoftware/model/UsuarioRegister.dart';
import 'package:construcaosoftware/screens/login/login_screen.dart';
import 'package:construcaosoftware/screens/register/components/background.dart';
import 'package:construcaosoftware/screens/register/components/or_divider.dart';
import 'package:construcaosoftware/screens/register/components/select_gender.dart';
import 'package:construcaosoftware/screens/register/components/social_icon.dart';
import 'package:construcaosoftware/util/already_have_an_account.dart';
import 'package:construcaosoftware/util/rounded_button.dart';
import 'package:construcaosoftware/util/rounded_input_field.dart';
import 'package:construcaosoftware/util/rounded_password_field.dart';
import 'package:construcaosoftware/util/util_date.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String valueGender = '';
  DateTime ? dateUser;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var phoneMaskFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});
  var birthMaskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32),
                  child: Image.asset(
                    "assets/images/image_login_register.png",
                    height: size.height * 0.35,
                  ),
                ),
                RoundedInputField(
                  controller: nomeController,
                  hintText: "Nome ",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Parâmetro obrigatório";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  icon: Icons.email_outlined,
                  controller: emailController,
                  hintText: "Seu e-mail",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Parâmetro obrigatório";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  keyBoardType: TextInputType.number,
                  icon: Icons.phone_android_outlined,
                  inputFormatters: [phoneMaskFormatter],
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Parâmetro obrigatório";
                    }
                    return null;
                  },
                  hintText: "Telefone",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  keyBoardType: TextInputType.number,
                  icon: Icons.date_range_outlined,
                  inputFormatters: [birthMaskFormatter],
                  controller: birthController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Parâmetro obrigatório";
                    }
                    return null;
                  },
                  hintText: "Data de nascimento",
                      onChanged: (value) {
                                  if (value.toString().length == 10) {
                                    var dateFormated =
                                        UtilDate.formatDataToDatabase(value);

                                    try {
                                      dateUser =
                                          DateFormat('yyyy-MM-dd')
                                              .parseStrict(dateFormated);
                                    } catch (e) {
                                      dateUser = null;
                                    }
                                  } else {
                                    dateUser = null;
                                  }

                                },
                ),
               
               
                RoundedPasswordField(
                  controller: passController,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Parâmetro obrigatório";
                    }
                    return null;
                  },
                ),
                 SelectGender(
                  onTap: (value) {
                    valueGender = value;
                  },
                ),
                   GetBuilder<ControllerLogin>(
                  builder: (controller) {
                    return RoundedButton(
                      loading: const Text('Cadastrar'),
                      text: "Cadastrar",
                      press:  () {

                        if(formKey.currentState!.validate()){
                            controller.registerUser(UsuarioRegister(
                              email: emailController.text,
                              password: passController.text,
                              name: nomeController.text,
                              admin: false,
                              gender: valueGender,
                              phone: phoneController.text,
                              birth: birthController.text,
                            ),
                            fail: (e){
                               Fluttertoast.showToast(
                                  msg: e,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                            
                            
                          
                              }
                            },
                    );
                  }
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                const OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
