import 'package:construcaosoftware/helpers/validators.dart';
import 'package:construcaosoftware/screens/register/components/background.dart';
import 'package:construcaosoftware/screens/register/singUpRegisterScreen.dart';
import 'package:construcaosoftware/util/already_have_an_account.dart';
import 'package:construcaosoftware/util/rounded_button.dart';
import 'package:construcaosoftware/util/rounded_input_field.dart';
import 'package:construcaosoftware/util/rounded_password_field.dart';
import 'package:flutter/material.dart';



class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key?  key,
  }) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key:formKey ,
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
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  controller: emailController,
                  validator:  (email) {
                    if (!emailValid(email!)) return 'E-mail inválido';
                    return null;
                  },
                  hintText: "Seu e-mail",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: passController,
                  onChanged: (value) {},
                   validator: (pass) {
                        if (pass!.isEmpty || pass.length < 6) return 'Senha inválida';
                        return null;
                      },
                ),
                RoundedButton(
                  loading: const Text('Login'),
                  text: "Login",
                  press:  () {

                    if(formKey.currentState!.validate()){

                            //    context.read<UserManager>().signIn(
                            //   user:UserStore(
                            //     email: emailController.text,
                            //     password: passController.text
                                
                            //   ),
                            //    onFail: (e){
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //         content: Text('Falha ao entrar: $e'),
                            //         backgroundColor: Colors.red,
                            //       )
                            //     );
                            //   },
                            //   onSuccess: (){
                            //      Navigator.pushNamed(context, '/');
                            //   }
                            
                           // );
                          }
                        },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreenRegister();
                        },
                      ),
                    );
                  },
                ),
              ],
            )
            
        ),
      ),
    );
  }
}