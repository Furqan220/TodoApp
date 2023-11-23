import 'package:todo_app/res/export_all.dart';

class CustomDialog {
  static void scaleDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final FocusNode titleFocus = FocusNode();
    final FocusNode descFocus = FocusNode();
    final FocusNode categoryFocus = FocusNode();
    String? selectedCategory;
    List<String>? category = ["personal", "business"];

    final TodoController todoCont = Get.put(TodoController());
    showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: AlertDialog(
              title: Text(
                "Add Todo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.sp,
                    color: AppColors.kprimary,
                    fontWeight: FontWeight.w500),
              ),

              content: SizedBox(
                height: 0.2.sh,
                width: 0.8.sw,
                child: Column(
                  children: [
                    TextFormField(
                        focusNode: titleFocus,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(descFocus);
                        },
                        // validator: ,
                        cursorColor: AppColors.kprimary,
                        cursorWidth: 1,
                        controller: titleController,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.kBlack,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit_outlined,
                              size: 18,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            label: Text("Title"),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.kBlack80,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                            filled: true,
                            fillColor: AppColors.kWhite,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.kprimary),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r),
                            ))),
                    0.021.sh.verticalSpace,
                    TextFormField(
                        focusNode: descFocus,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(categoryFocus);
                        },
                        // validator: ,
                        cursorColor: AppColors.kprimary,
                        cursorWidth: 1,
                        controller: descController,
                        minLines: 2,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.kBlack,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit_outlined,
                              size: 18,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            label: Text("Description"),
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.kBlack80,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                            filled: true,
                            fillColor: AppColors.kWhite,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.kprimary),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r),
                            ))),
                    0.010.sh.verticalSpace,
                    DropdownButtonFormField<String>(
                        value: selectedCategory,
                        items: category
                            .map((String e) => DropdownMenuItem<String>(
                                value: e, child: Text(e.capitalize!)))
                            .toList(),
                        onChanged: (v) {
                          selectedCategory = v;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            label: Text("Category"),
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.kBlack80,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                            filled: true,
                            fillColor: AppColors.kWhite,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.kprimary),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.kprimary),
                              borderRadius: BorderRadius.circular(10.r),
                            )))
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              // actionsPadding: EdgeInsets.zero,
              actions: <Widget>[
                CustomButton(
                  buttonText: "Cancel",
                  bgColor: AppColors.kWhite,
                  fgColor: AppColors.kprimary,
                  onTap: () => Get.back(),
                  width: 0.15.sh,
                  height: 0.046.sh,
                  radius: 30.r,
                  bdColor: AppColors.kprimary,
                  buttonTextColor: AppColors.kprimary,
                ),
                CustomButton(
                  onTap: () async {
                    final dynamic data = {
                      "userId": User.data.id,
                      "title": titleController.text.trim(),
                      "desc": descController.text.trim(),
                      "category": selectedCategory
                    };
                    Get.back();
                    G.Log(data);
                    await todoCont.createTodo(data, context);
                  },
                  buttonText: "Add",
                  bgColor: AppColors.kprimary,
                  fgColor: AppColors.kWhite,
                  width: 0.15.sh,
                  height: 0.046.sh,
                  bdColor: AppColors.kprimary,
                  buttonTextColor: AppColors.kWhite,
                  radius: 30.r,
                )
              ],
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: false);
  }
}
