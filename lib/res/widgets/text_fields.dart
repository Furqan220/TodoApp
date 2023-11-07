import 'package:todo_app/res/export_all.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? suffixIcon;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final FocusNode? focus;
  final FocusNode? nextFocus;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.labelText,
    this.suffixIcon,
    this.validator,
    this.focus,
    this.nextFocus,
  });

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
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite),
          ),
          10.verticalSpace,
          TextFormField(
            focusNode: widget.focus,
            onFieldSubmitted: (value) {
              if (widget.focus != null && widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              } else if (widget.focus != null && widget.nextFocus == null) {
                FocusScope.of(context).unfocus();
              }
            },
            validator: widget.validator ?? null,
            cursorColor: AppColors.kValue1,
            cursorWidth: 1,
            obscureText: widget.labelText == "Password" ||
                    widget.labelText == "New Password" ||
                    widget.labelText == "Confirm New Password"
                ? _obsecureText
                : false,
            controller: widget.controller ?? null,
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.kBlack,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.r, vertical: 19.r),
                hintText: widget.hintText ?? '',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.kBlack80,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
                prefixIconColor: Colors.white,
                // suffixIconColor: Color(0xffBCC5D4),
                filled: true,
                fillColor: AppColors.kWhite,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: AppColors.kValue1),
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
                                color: AppColors.kBlack80,
                                size: 20,
                              )
                            : Icon(
                                Icons.visibility,
                                color: AppColors.kBlack80,
                                size: 20,
                              ))
                    : null),
          ),
        ],
      ),
    );
  }
}
