import 'package:auth_module/CustomWidgets/textwidget.dart';
import 'package:auth_module/Fonts/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.logo,
    required this.buttonName,
    this.color,
    this.border,
    this.txtcolor,
    this.onTap,
  });
  final Widget logo;
  final String buttonName;
  final Color? color;
  final BoxBorder? border;
  final Color? txtcolor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: border,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: color,
            ),
            width: double.infinity,
            height: 48,
            child: Center(
              child: TextWidget(
                text: buttonName,
                color: txtcolor,
                fontfamily: Fonts.poppins,
                fontweight: FontWeight.w500,
                fontsize: 16,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: logo,
          ),
        ],
      ),
    );
  }
}
