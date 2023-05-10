import 'package:flutter/material.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/function.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertDialogOneBtnCustomized {
  BuildContext context;
  String title;
  String desc;
  String textBtn;
  String image;
  // Color bgBtn, fgBtn;
  double titleFSize, descFSize;
  VoidCallback onPressedBtn;
  VoidCallback closePressed;
  bool onWillPopActive;
  AlertDialogOneBtnCustomized(
      this.context,
      this.title,
      this.desc,
      this.textBtn,
      this.image,
      //  this.bgBtn ,
      // this.fgBtn ,
      this.onPressedBtn,
      this.titleFSize,
      this.descFSize,
      this.closePressed,
      this.onWillPopActive);
  void show() {
    Alert(
            onWillPopActive: onWillPopActive,
            closeFunction: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            context: context,
            title: title,
            image: Image(
              image: AssetImage('lib/assets/$image'),
              width: 100 * SizeConfig.ratioWidth,
            ),
            desc: desc,
            buttons: [
              DialogButton(
                height: 45 * SizeConfig.ratioHeight,
                radius: BorderRadius.all(
                    Radius.circular(8 * SizeConfig.ratioRadius)),
                color: Constants.mainColor,
                child: Text(textBtn,
                    style: TextStyle(
                        fontSize: 20 * SizeConfig.ratioFont,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop();
                  onPressedBtn();
                },
              ),
            ],
            style: AlertStyle(
                descStyle: TextStyle(
                    fontSize: descFSize * SizeConfig.ratioFont,
                    fontWeight: FontWeight.normal),
                titleStyle:
                    TextStyle(fontSize: titleFSize * SizeConfig.ratioFont)))
        .show();
  }
}
