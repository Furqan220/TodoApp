import 'package:todo_app/export_all.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? suffixIcon;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.prefixIcon,
      this.keyboardType,
      this.labelText,
      this.suffixIcon,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText ?? "",
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w600, color: kWhite),
          ),
          10.verticalSpace,
          TextFormField(
            validator: widget.validator ?? null,
            cursorColor: kValue1,
            cursorWidth: 1,
            obscureText: widget.labelText == "Password" ||
                    widget.labelText == "New Password" ||
                    widget.labelText == "Confirm New Password"
                ? _obsecureText
                : false,
            controller: widget.controller ?? null,
            style: TextStyle(
                fontSize: 16.sp,
                color: kBlack,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.r, vertical: 19.r),
                hintText: widget.hintText ?? '',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: kBlack80,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
                prefixIconColor: Colors.white,
                // suffixIconColor: Color(0xffBCC5D4),
                filled: true,
                fillColor: kWhite,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: kValue1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 2, color: textfieldbd),
                //   borderRadius: BorderRadius.circular(10.r),
                // ),
                prefixIcon: widget.prefixIcon ?? null,
                suffixIcon: widget.labelText == "Password" ||
                        widget.labelText == "New Password" ||
                        widget.labelText == "Confirm New Password"
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        icon: _obsecureText
                            ? Icon(
                                Icons.visibility_off,
                                color: kBlack80,
                                size: 20,
                              )
                            : Icon(
                                Icons.visibility,
                                color: kBlack80,
                                size: 20,
                              ))
                    : null),
          ),
        ],
      ),
    );
  }
}
