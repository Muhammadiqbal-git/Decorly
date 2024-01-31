import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final AssetImage logo;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final String hintText;
  final Color backgroundColor;
  final double borderRadius;
  final bool isObsecure;

  const CustomForm({
    super.key,
    required this.logo,
    required this.textEditingController,
    required this.textInputAction,
    this.hintText = "",
    this.backgroundColor = accent_cr,
    this.borderRadius = 12,
    this.isObsecure = false,
  });
  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool obscured = false;
  @override
  void initState() {
    print("awal forms");
    obscured = widget.isObsecure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("form kebuild");
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          ImageIcon(widget.logo, color: primary_cr),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: widget.textEditingController,
              validator: (value) {
                if (value == "tes") {
                  return "test error";
                }
                return null;
              },
              obscureText: obscured,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: caption_1.copyWith(color: subtle_text_cr),
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
