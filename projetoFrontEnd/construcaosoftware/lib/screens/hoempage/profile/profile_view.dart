import 'package:construcaosoftware/controller/login/controller_login.dart';
import 'package:construcaosoftware/widgets/text_field_profile.dart';
import 'package:construcaosoftware/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child:
         GetBuilder<ControllerLogin>(
          builder: (controller) {
 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: ()  {
                             
                            },
                            child:const UserAvatar(
                              photo: 'https://www.auctus.com.br/wp-content/uploads/2017/09/sem-imagem-avatar.png',
                              radius: 37,
                            ),
                          ),
                        const  SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.usuario!.name!,
                                      style: Get.textTheme.headline3,
                                    ),
                                   const  SizedBox(width: 10),
                                    SvgPicture.asset(
                                     "assets/icons/brazil.svg",
                                      width: 24,
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 7),
                                Row(
                                  children: [
                                    CheckIcon(
                                      checkedColor: AppColors.primary,
                                      size: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      LocaleKeys.verified.tra(),
                                      style: Get.textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      
                      SizedBox(height: 20),
                      Text(
                        LocaleKeys.profilePage_stepsLeft.tra(args: ['2']),
                        style: Get.textTheme.headline4,
                      ),
                      SizedBox(height: 15),
                      StepsIndicator(
                        current: 2,
                        count: 4,
                      ),
                      SizedBox(height: 20),
                      Text(
                        LocaleKeys.profilePage_stepsReason.tra(),
                      ),
                    ],
                  ),
                ),x 
              ),
            ),
        
               TextFieldTwoItens(
                icon: const Icon(Icons.person,
                          color:Colors.blueGrey),
                      
                  text: 'Minha conta',
                      onPressed: () => {}),


                 TextFieldTwoItens(
                icon: const Icon(Icons.person,
                          color:Colors.blueGrey),
                      
                  text: 'Ver meu perfil',
                      onPressed: () {}),
   
            
             

             TextFieldTwoItens(
                      icon: const Icon(Icons.person_add_alt_1_outlined,
                          color:Colors.blueGrey),
                      text: 'Convide um amigo',
                      onPressed: () {}),                     
           
              TextFieldTwoItens(
                      icon:const  Icon(Icons.book_online,
                          color:Colors.blueGrey),
                      text: 'Termos e condições',
                      onPressed: (){}),    

            TextFieldTwoItens(
                      icon: const Icon(Icons.book_online,
                          color:Colors.blueGrey),
                      text: 'Sobre o app',
                      onPressed: () {}),   
           

             TextFieldTwoItens(
                      icon:const Icon(Icons.help_outline_outlined,
                          color:Colors.blueGrey),
                      text: 'Ajuda',
                      onPressed: (){}),
                    

             TextFieldTwoItens(
                      icon: const Icon(Icons.exit_to_app_outlined,
                          color:Colors.blueGrey),
                      text: 'Sair',
                      onPressed: (){}),
            
          ],
        );
      })),
    );
  }

  
}
