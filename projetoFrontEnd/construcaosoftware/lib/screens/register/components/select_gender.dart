import 'package:construcaosoftware/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SelectGender extends StatefulWidget {
  const SelectGender({
    Key? key,
    required this.onTap,
    this.initialValue,
  }) : super(key: key);

  final Function(String change) onTap;
  final String? initialValue;

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  bool masculinoSelect = false;
  late String opcaoEscolhida;
  RxBool validateForm = false.obs;

  @override
  void initState() {
    super.initState();
    opcaoEscolhida = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 50, top: 8),
      child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text('Selecione seu gênero', style: TextStyle(color: Colors.white, fontSize: 16),
                 textAlign: TextAlign.start,),
                const    SizedBox(height: 5),
          Row(
     
            children: [
              FilterChip(
                pressElevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                label: Text(
                  'Masculino',
                  style: TextStyle( color:  opcaoEscolhida == 'M'
                      ? Colors.white
                      : const Color(0xffB4B7BB),
                
                )),
                shape: StadiumBorder(
                    side: BorderSide(
                        color: opcaoEscolhida == 'M'
                            ? kPrimaryColor
                            : const Color(0xffB4B7BB))),
                backgroundColor: opcaoEscolhida == 'M'
                    ? kPrimaryColor
                    : Colors.transparent,
                onSelected: (bool value) {
                  widget.onTap('M');
                  setState(() {
                    opcaoEscolhida = 'M';
                  });
                },
              ),
              const SizedBox(width: 8),
              FilterChip(
                pressElevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                label: Text(
                  'Feminino',
                style: TextStyle(color:  opcaoEscolhida == 'F'
                      ? Colors.white
                      : const Color(0xffB4B7BB),
                
                ),),
                shape: StadiumBorder(
                    side: BorderSide(
                        color: opcaoEscolhida == 'F'
                            ? kPrimaryColor
                            : const Color(0xffB4B7BB))),
                backgroundColor: opcaoEscolhida == 'F'
                    ? kPrimaryColor
                    : Colors.transparent,
                onSelected: (bool value) {
                  widget.onTap('F');

                  setState(() {
                    opcaoEscolhida = 'F';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
