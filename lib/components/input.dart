import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gawe/utils/constants.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key, this.value, this.title, this.onChanged, this.hintText, this.isHidden = false, this.prefixIcon, this.enabled = true, this.type});
  final String? value;
  final String? title;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final bool isHidden;
  final bool? enabled;
  final Widget? prefixIcon;
  final TextInputType? type;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController controller;
  late bool isHidden;

  void toggle() {
    setState(() {
      isHidden = !isHidden; 
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    isHidden = widget.isHidden;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        autocorrect: false,
        obscureText: isHidden,
        obscuringCharacter: "*",
        showCursor: false,
        enabled: widget.enabled,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:  const EdgeInsets.all(20),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: _suffixIcon(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15)
            )
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15)
            )
          )
        ),
        onChanged: (value) => widget.onChanged!(value)
      ),
    );
  }

  _suffixIcon() {
    if (widget.type == TextInputType.visiblePassword) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            InkWell(
              onTap: toggle,
              child: isHidden ? FaIcon(FontAwesomeIcons.eye, size: 16, color: Colors.black) : FaIcon(FontAwesomeIcons.eyeSlash, size : 16, color: Colors.black)
            )
          ],
        )
      );
    }
  }
}