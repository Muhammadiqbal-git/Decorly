import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final AssetImage? logo;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onEdittingComplete;
  final TextStyle? inputStyle;
  final double width;
  final String hintText;
  final TextAlign? textAlign;
  final TextStyle? hintStyle;
  final Color backgroundColor;
  final BoxBorder? borders;
  final double borderRadius;
  final bool isObsecure;
  final bool? enabled;

  const CustomForm({
    super.key,
    required this.textEditingController,
    required this.textInputAction,
    this.logo,
    this.focusNode,
    this.onChanged,
    this.onEdittingComplete,
    this.width = double.maxFinite,
    this.inputStyle,
    this.hintText = "",
    this.textAlign,
    this.hintStyle,
    this.backgroundColor = accent_cr,
    this.borders,
    this.borderRadius = 12,
    this.isObsecure = false,
    this.enabled,

  });
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool obscured = false;
  @override
  void initState() {
    print("awal forms and not obscure ${widget.isObsecure}");
    obscured = widget.isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.borders
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          widget.logo != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ImageIcon(widget.logo, color: primary_cr),
                )
              : const SizedBox(),
          Expanded(
            child: TextFormField(
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEdittingComplete,
              focusNode: widget.focusNode,
              controller: widget.textEditingController,
              validator: (value) {
                if (value == "tes") {
                  return "test error";
                }
                return null;
              },
              obscureText: obscured,
              textInputAction: widget.textInputAction,
              style: widget.inputStyle ??
                  body_2.copyWith(fontSize: 16, color: text_cr),
              textAlign: widget.textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ??
                      caption_1.copyWith(color: subtle_text_cr),
                  isCollapsed: true,
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(width: 15),
          if (widget.isObsecure == true)
            InkWell(
              onTap: () {
                obscured = !obscured;
                setState(() {});
              },
              child: obscured
                  ? const Icon(Icons.visibility_off_rounded)
                  : const Icon(Icons.visibility_rounded),
            ),
          if (widget.isObsecure == true) const SizedBox(width: 15)
        ],
      ),
    );
  }
}
