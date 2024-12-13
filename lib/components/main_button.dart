import 'package:flutter/material.dart';
import 'package:gawe/utils/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final double? width, height;
  final bool? disable;
  final bool? loading;
  const MainButton({super.key, required this.text, this.onTap, this.width = 150, this.height = 70, this.textStyle, this.disable = false, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable == true ? () {} : onTap ,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: disable == true ? Constants.disableColor : Constants.primaryColor ,
          border: Border.all(color: Constants.textColor),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 4),
            color: Colors.black
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15))
        ),
        child: Center(
          child: loading == false ? Text(text, 
            style: textStyle ?? const TextStyle(
              color: Constants.textColor, 
              fontWeight: FontWeight.bold,
              fontSize: 18
            ), 
            textAlign: TextAlign.center,
          ) : const CircularProgressIndicator(
            color: Colors.black,
          ),
        )
      ),
    );
  }
}