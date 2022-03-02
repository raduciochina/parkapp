import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  const EntryField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: hint, hintStyle: TextStyle(fontSize: 13)),
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class EntryFieldR extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool showSuffixIcon;
  EntryFieldR(this.labelText, this.hintText, this.showSuffixIcon);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText!,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black, fontSize: 13),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey),
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: showSuffixIcon
                ? Icon(Icons.arrow_drop_down_outlined, color: Colors.grey)
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 13, color: Colors.grey[500]),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
