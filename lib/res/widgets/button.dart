import 'package:todo_app/res/export_all.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonTextColor;
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? fgColor;
  final Color? bdColor;
  final LinearGradient? bgColorLinear;
  final double? width;
  final double? height;
  final double? gap;
  final double? radius;

  CustomButton(
      {super.key,
      required this.buttonText,
      this.buttonTextColor,
      this.onTap,
      this.bgColor,
      this.bdColor,
      this.fgColor,
      this.bgColorLinear,
      this.width,
      this.height,
      this.radius,
      this.gap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: fgColor ?? AppColors.kWhite,
          padding: EdgeInsets.symmetric(
              vertical: 0.015.sh, horizontal: gap ?? 0.046.sw),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10.r),
              side: BorderSide(color: bdColor ?? AppColors.kWhite, width: 1)),
          backgroundColor: bgColor ?? AppColors.kprimary,
          elevation: 0.0,
          fixedSize: Size(width ?? 0.860.sw,height ?? 0.06.sh),
        ),
        onPressed: onTap ?? () {},
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor ?? AppColors.kBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ));
    /*return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 0.06.sh,
        // width: 388.w,
        decoration: BoxDecoration(
            gradient: bgColorLinear,
            color: bgColor ?? AppColors.kWhite,
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor ?? AppColors.kBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  
  */
  }
}
