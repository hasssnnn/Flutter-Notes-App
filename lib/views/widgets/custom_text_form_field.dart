import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.hint,
//     this.maxLines = 1,
//     this.onSaved,
//   });
//   final String hint;
//   final int maxLines;
//   final void Function(String?)? onSaved;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         if(value?.isEmpty?? true)
//         {

//             print('Field is requires');

//         }
//         return null;
//       },
//       onSaved: onSaved,
//       maxLines: maxLines,
//       cursorColor: kPrimaryColor,
//       decoration: InputDecoration(
//           hintText: hint,
//           border: buildBorder(),
//           focusedBorder: buildBorder(kPrimaryColor),
//           enabledBorder: buildBorder()),
//     );
//   }

//   OutlineInputBorder buildBorder([color]) {
//     return OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: color ?? Colors.white));
//   }
// }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  String? _validateInput(String? value) {
    if (value?.isEmpty ?? true) {
      return '$hint field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateInput,
      onChanged: onChanged, // Set the validator function here
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
