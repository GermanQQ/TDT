import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/domain/utils/utils.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final int? maxLength;
  final bool showCounterText;
  final bool isPassword;
  final Function(String text)? onChanged;
  final TextEditingController? controller;
  CustomTextField({
    this.hintText,
    this.maxLength = 40,
    this.showCounterText = false,
    this.controller,
    this.onChanged,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hideContent = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      child: Stack(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input) => widget.isPassword ? isValidPassword(input ?? '') : isValidEmail(input ?? ''),
            onChanged: widget.onChanged,
            maxLines: 1,
            cursorColor: accentColor,
            controller: widget.controller,
            obscureText: widget.isPassword && hideContent,
            enableSuggestions: widget.isPassword ? false : true,
            autocorrect: widget.isPassword ? false : true,
            style: Theme.of(context).textTheme.headline4,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              counterText: widget.showCounterText ? null : "",
              hintStyle: Theme.of(context).textTheme.headline5,
              labelStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.only(left: 6, right: widget.isPassword ? 50 : 6),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: grayColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: accentColor),
              ),
            ),
          ),
          if (widget.isPassword)
            Positioned(
              top: 6,
              right: 0,
              child: GestureDetector(
                  onTap: () => setState(() => hideContent = !hideContent),
                  child: Icon(hideContent ? Icons.visibility : Icons.visibility_off, size: 30, color: grayColor)),
            )
        ],
      ),
    );
  }
}
