import 'package:todo_app/export_all.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonTextColor;
  final VoidCallback? onTap;
  final Color? bgColor;
  final LinearGradient? bgColorLinear;

  CustomButton({
    super.key,
    required this.buttonText,
    this.buttonTextColor,
    this.onTap,
    this.bgColor,
    this.bgColorLinear,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 0.06.sh,
        // width: 388.w,
        decoration: BoxDecoration(
            gradient: bgColorLinear,
            color: bgColor ?? kWhite,
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor ?? kBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
