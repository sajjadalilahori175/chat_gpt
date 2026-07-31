

import 'package:chat_gpt/constans/constants.dart';
import 'package:chat_gpt/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';



class Services{
  static Future<void> showModelsheet({required BuildContext context})async{
    await showModalBottomSheet(shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
    ),backgroundColor: scaffoldBackgroundColor,context: context, builder: (context) {
      return const Padding(
        padding: EdgeInsets.all(18.0),
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Flexible(child: TextWidget(label: "chosen Model",fontSize: 16,),),
          Flexible(child: ModelsDrowDownWidget())
        ],),
      );
    },);
  }
}