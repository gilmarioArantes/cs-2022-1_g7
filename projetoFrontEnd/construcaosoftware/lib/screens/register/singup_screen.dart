import 'package:construcaosoftware/helpers/validators.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

   SignUpScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 32),
                child: Image.asset('assets/images/logo.png',
                width: 300,),
              ),
              Center(
                
                child: Card(
                   shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
                            margin: const EdgeInsets.symmetric(horizontal: 16),

                  child: Form(
                    key: formKey,
                    child:ListView(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      children: <Widget>[
                        TextFormField(
                          
                          decoration: const InputDecoration(
                            hintText: 'Nome Completo',
                              enabledBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color:Color.fromARGB(255, 4, 125, 141), width: 2.0),),
                            border:  OutlineInputBorder(),
                          ),
                          validator: (name) {
                            if (name!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (name.trim().split(' ').length <= 1) {
                              return 'Preencha seu Nome completo';
                            }
                            return null;
                          },
                          
                        //  onSaved: (name) => user.name = name,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                            // enabled: !userManager.loading,
                          decoration: const InputDecoration(hintText: 'E-mail',
                             enabledBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color:Color.fromARGB(255, 4, 125, 141), width: 2.0),),
                            border:  OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (!emailValid(email)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                         // onSaved: (email) => user.email = email,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Senha',
                               enabledBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color:Color.fromARGB(255, 4, 125, 141), width: 2.0),),
                            border:  OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (pass.length < 6) {
                              return 'Senha muito curta';
                            }
                            return null;
                          },
                        //  onSaved: (pass) => user.password = pass,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          //   enabled: !userManager.loading,
                          decoration: const InputDecoration(hintText: 'Repita a Senha',
                              enabledBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(color:Color.fromARGB(255, 4, 125, 141), width: 2.0),),
                            border:  OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (pass) {
                            if (pass!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (pass.length < 6) {
                              return 'Senha muito curta';
                            }
                            return null;
                          },
                      //    onSaved: (pass) => user.confirmPassword = pass,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                // if (user.password != user.confirmPassword) {
                                //   Fluttertoast.showToast(
                                //       msg: "Senhas não coincidem!",
                                //       toastLength: Toast.LENGTH_SHORT,
                                //       gravity: ToastGravity.CENTER,
                                //       timeInSecForIosWeb: 1,
                                //       backgroundColor: Colors.red,
                                //       textColor: Colors.white,
                                //       fontSize: 16.0);

                                //   return;
                                // }

                                // context.read<UserManager>().signUp(
                                //     user: user,
                                //     onSuccess: () {
                                //        Navigator.of(context).pop();
                                //     },
                                //     onFail: (e) {
                                //       Fluttertoast.showToast(
                                //           msg: "Falha ao cadastrar $e",
                                //           toastLength: Toast.LENGTH_SHORT,
                                //           gravity: ToastGravity.CENTER,
                                //           timeInSecForIosWeb: 1,
                                //           backgroundColor: Colors.red,
                                //           textColor: Colors.white,
                                //           fontSize: 16.0);
                                //     });
                              }
                            },
                            child: const Text(
                              'Criar Conta',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
