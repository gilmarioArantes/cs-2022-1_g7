import 'package:construcaosoftware/controller/login/controller_login.dart';
import 'package:construcaosoftware/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
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
                            onTap: () async {
                              await showModalSelecaoFoto(context);
                            },
                            child: UserAvatar(
                              photo: controllerMobx.userLogged.pictureUrl ??'https://www.auctus.com.br/wp-content/uploads/2017/09/sem-imagem-avatar.png',
                              radius: 37,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.user.fullName,
                                      style: Get.textTheme.headline3,
                                    ),
                                    SizedBox(width: 10),
                                    SvgPicture.asset(
                                      Images.unitedKingdom,
                                      width: 24,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7),
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
                ),
              ),
            ),
            // MenuButton(
            //   title: LocaleKeys.profilePage_personalInformations.tra(),
            //   onTap: () => Get.toNamed(Routes.editInformation),
            // ),
            //  MenuButton(
            //   title: 'Sobre',
            //   onTap: () => Get.toNamed(Routes.aboutDude),
            // ),
            //  MenuButton(
            //   title: 'Minhas preferências',
            //   onTap: () => Get.toNamed(Routes.myPreferences),
            // ),
               TextFieldTwoItens(
                icon: Icon(Icons.person,
                          color:Colors.blueGrey),
                      
                  text: 'Minha conta',
                      onPressed: () => Get.toNamed(Routes.myAccount)),


                 TextFieldTwoItens(
                icon: Icon(Icons.person,
                          color:Colors.blueGrey),
                      
                  text: 'Ver meu perfil',
                      onPressed: () => Get.toNamed(Routes.viewProfileDude)),

         TextFieldTwoItens(
                      icon: Icon(Icons.calendar_today_outlined,
                          color:Colors.blueGrey),
                      text: 'Minhas reservas',
                      onPressed: () => Get.toNamed(Routes.historic)),

            TextFieldTwoItens(
                      icon: Icon(Icons.credit_card,
                          color:Colors.blueGrey),
                      text: 'Minhas formas de pagamento',
                      onPressed: () => Get.toNamed(Routes.payments)),            
            
             TextFieldTwoItens(
                      icon: Icon(Icons.radar_sharp,
                          color:Colors.blueGrey),
                      text: 'Radar dude',
                      onPressed: () => Get.toNamed(Routes.radar)),  

             TextFieldTwoItens(
                      icon: Icon(Icons.person_add_alt_1_outlined,
                          color:Colors.blueGrey),
                      text: 'Convide um amigo',
                      onPressed: () => Get.toNamed(Routes.inviteFriend)),                     
           
              TextFieldTwoItens(
                      icon: Icon(Icons.book_online,
                          color:Colors.blueGrey),
                      text: 'Termos e condições',
                      onPressed: () => Get.toNamed(Routes.terms)),    

            TextFieldTwoItens(
                    img: Images.logo,
                      icon: Icon(Icons.book_online,
                          color:Colors.blueGrey),
                      text: 'Sobre o dude',
                      onPressed: () => Get.toNamed(Routes.learn)),   
           

             TextFieldTwoItens(
                      icon: Icon(Icons.help_outline_outlined,
                          color:Colors.blueGrey),
                      text: 'Ajuda',
                      onPressed: ()  => Get.toNamed(Routes.help), ),
            // MenuButton(
            //   title: LocaleKeys.profilePage_help.tra(),
            //   onTap: () => Get.toNamed(Routes.help),
            // ),

             TextFieldTwoItens(
                      icon: Icon(Icons.exit_to_app_outlined,
                          color:Colors.blueGrey),
                      text: 'Sair',
                      onPressed: () => controller.global.logout()),
            // MenuButton(
            //   title: LocaleKeys.profilePage_leave.tra(),
            //   onTap: () => controller.global.logout(),
            // ),
          ],
        );
      })),
    );
  }

  
  Future<void> takePhotoCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    final bytes = File(image!.path).readAsBytesSync();
    // ignore: omit_local_variable_types
    String imgBase64 = base64Encode(bytes);
    controllerMobx.sendPhoto(imgBase64, falha: (falha) {
        Get.back();
      Navigator.pop(context);
    }, sucesso: () {
      Get.back();
      Navigator.pop(context);
    }, carregando: () {
      Get.dialog(
        WillPopScope(
          onWillPop: () => Future.value(false),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });
  }

  Future<void> takePhotoGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    final bytes = File(image!.path).readAsBytesSync();
    String imgBase64 = base64Encode(bytes);
    controllerMobx.sendPhoto(imgBase64, falha: (falha) {}, sucesso: () {
      Get.back();
      Navigator.pop(context);
    }, carregando: () {
      Get.dialog(
        WillPopScope(
          onWillPop: () => Future.value(false),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    });
  }

 Future<void>  showModalSelecaoFoto(BuildContext context)async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) =>  Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius:  8 ,
            offset: Offset(
              0,
              6,
            ), // changes position of shadow
          ),
        ],
      ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Wrap(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Selecionar de',
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () => Navigator.pop(context))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.photo_album_outlined),
                                onPressed: () {
                                  takePhotoGallery();
                                }),
                            Text('Galeria')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.camera_alt_outlined),
                                onPressed: () {
                                    takePhotoCamera();
                                }),
                            Text('Câmera')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
