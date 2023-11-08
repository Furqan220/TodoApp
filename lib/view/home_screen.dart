import 'dart:math';

import 'package:todo_app/res/export_all.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController todosController = Get.put(TodoController());

  RxDouble value = 0.0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todosController.getTodos =
        todosController.getAllTodos(todosController.allTodos, context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onHorizontalDragUpdate: (e) {
          // print(e.delta.dx.toString());
          if (e.delta.dx > 0) {
            value.value = 1;
          } else {
            value.value = 0;
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xff0f1e4f),
                    AppColors.kprimary,
                    AppColors.kValue1
                  ])),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.only(left: 0.15.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      0.15.sh.verticalSpace,
                      Container(
                        // color: Colors.white,
                        height: 0.17.sh,
                        width: 0.5.sw,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              child: CircularPercentIndicator(
                                radius: 52,
                                progressColor: Color(0xff7809a7),
                                lineWidth: 3,
                                percent: 0.7,
                                circularStrokeCap: CircularStrokeCap.round,

                                // padding: EdgeInsets.all(5),
                                // decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //         width: 3, color: Color(0xff7809a7))),
                                center: Container(
                                  margin: EdgeInsets.all(8),
                                  // padding: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('assets/Ellipse 3.png'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: InkWell(
                                onTap: () {
                                  value.value == 0.0
                                      ? value.value = 1
                                      : value.value = 0.0;
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 0.018.sw),
                                  height: 0.053.sh,
                                  width: 0.096.sw,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Color(0xff2c396d))),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // 0.016.sh.verticalSpace,
                      Text(User.data.username.replaceAll(RegExp(r' '), '\n'),
                          // "Furqan\nAhmed",
                          style: TextStyle(
                              color: AppColors.kWhite,
                              fontSize: 45.sp,
                              height: 1.5,
                              fontWeight: FontWeight.bold)),
                      0.064.sh.verticalSpace,
                      MenuButton("All Tasks", "assets/pvc_icon.png"),
                      0.055.sh.verticalSpace,
                      MenuButton("Edit Proile", "assets/edit_icon.png"),

                      0.055.sh.verticalSpace,
                      CustomButton(
                        buttonText: "Logout",
                        bgColor: AppColors.kWhite,
                        width: .4.sw,
                        radius: 30,
                        fgColor: AppColors.kprimary,
                        onTap: () async {
                          await User().clear().then(
                              (value) => Get.offAllNamed(RouteNames.login));
                        },
                      ),
                      // MenuButton("Rate Us", "assets/pngwing.com.png"),
                      0.032.sh.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
                curve: Curves.easeInBack,
                tween: Tween<double>(begin: 0, end: value.value),
                duration: Duration(milliseconds: 400),
                builder: (_, double val, __) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 280 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      backgroundColor: AppColors.kWhite,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                value.value == 0.0
                                    ? value.value = 1
                                    : value.value = 0.0;
                              },
                              child: Icon(
                                Icons.filter_list,
                                color: AppColors.kBlack,
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: AppColors.kprimary,
                              backgroundImage:
                                  AssetImage('assets/Ellipse 3.png'),
                            )
                          ],
                        ),
                      ),
                      body: FutureBuilder<Rx<List<TodoModel>>>(
                        future: todosController.getTodos,
                        builder: (context,
                            AsyncSnapshot<Rx<List<TodoModel>>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 0.055.sw),
                              children: [
                                0.032.sh.verticalSpace,
                                Text(
                                    "Whats'up ${HelperFunctions.getFirstName(User.data.username)}",
                                    style: TextStyle(
                                        color: AppColors.kBlack,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.bold)),
                                0.021.sh.verticalSpace,
                                Text("Categories",
                                    style: TextStyle(
                                        color: AppColors.kGrey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600)),
                                0.021.sh.verticalSpace,
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .032.sw),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      countBox(),
                                      countBox(
                                        task: "20",
                                        category: "Personal",
                                        valueColors: AppColors.kprimary,
                                      ),
                                    ],
                                  ),
                                ),
                                0.032.sh.verticalSpace,
                                Text("Today's Tasks",
                                    style: TextStyle(
                                        color: AppColors.kGrey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600)),
                                0.021.sh.verticalSpace,
                                ...List.generate(
                                    todosController.todaysTodos.value.length,
                                    (index) => TodoTile(todosController
                                        .todaysTodos.value[index])),
                                0.021.sh.verticalSpace,
                                Text("other than Today's Tasks",
                                    style: TextStyle(
                                        color: AppColors.kGrey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600)),
                                0.021.sh.verticalSpace,
                                ...List.generate(
                                    todosController.olderTodos.value.length,
                                    (index) => TodoTile(todosController
                                        .olderTodos.value[index]))
                              ],
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: Utils.spinkit);
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          } else {
                            return Container();
                          }
                        },
                      ),
                      floatingActionButton: Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                              color: AppColors.kprimary.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(4, 4)),
                          BoxShadow(
                              color: AppColors.kprimary.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(-4, -4))
                        ]),
                        child: FloatingActionButton(
                          elevation: 0.0,
                          onPressed: () {
                            G.Log(todosController.todaysTodos.value.length);
                          },
                          backgroundColor: AppColors.kprimary,
                          child: Icon(
                            Icons.add,
                            size: 30.sp,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 15, offset: Offset(0, 5))
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.023.sw),
          hintText: 'Search tasks ...',
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: AppColors.kGrey,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget countBox(
      {String task = '40',
      category = "Business",
      Color valueColors = AppColors.kValue1}) {
    return Container(
      // width: 0.40.sw,
      // height: 0.40.sw,
      // padding: EdgeInsets.symmetric(horizontal: 0.046.sw, vertical: 0.016.sh),
      // decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: AppColors.kWhite,
      //     // borderRadius: BorderRadius.circular(20.r),
      //     boxShadow: [
      //       BoxShadow(
      //           color: Color.fromARGB(66, 19, 19, 75),
      //           blurRadius: 15,
      //           offset: Offset(0, 5))
      //     ]),
      child: CircularPercentIndicator(
        radius: 70,
        lineWidth: 10.0,
        animation: true,
        percent: 0.5,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              "50.0%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              "$category",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ),
        // footer: new Text(
        //   "Sales this week",
        //   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        // ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: valueColors,
      ),

      /*    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$task tasks",
            style: TextStyle(
                fontSize: 16.sp, color: AppColors.kGrey, fontWeight: FontWeight.w500),
          ),
          0.021.sh.verticalSpace,
          Text(
            "$category",
            style: TextStyle(
                fontSize: 20.sp, color: AppColors.kBlack, fontWeight: FontWeight.bold),
          ),
          // 0.032.sh.verticalSpace,
          // LinearProgressIndicator(
          //   value: 0.7,
          //   backgroundColor: AppColors.kGrey,
          //   color: valueColors,
          // ),
          // 0.021.sh.verticalSpace,
        ],
      ),
   
   */
    );
  }

  Widget TodoTile(TodoModel todo) {
    RxBool selected = true.obs;
    // if (value.value != 0.0) {
    //   return Container(
    //     // color: Colors.green,
    //     padding: EdgeInsets.symmetric(horizontal: 0.046.sw),
    //     margin: EdgeInsets.symmetric(vertical: 0.053.sw),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           height: 25.h,
    //           width: 25.w,
    //           decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               border: Border.all(color: AppColors.kprimary, width: 2)),
    //         ),
    //         0.046.sw.horizontalSpace,
    //         Text(TaskName,
    //             style: TextStyle(
    //                 color: AppColors.kBlack,
    //                 fontSize: 22.sp,
    //                 fontWeight: FontWeight.w500)),
    //       ],
    //     ),
    //   );
    // } else {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            color: AppColors.kprimary,
            size: 30.sp,
          ),
        ),
        0.023.sw.horizontalSpace,
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: 30.sp,
          ),
        ),
      ]),
      child: Obx(
        () => Container(
          // color: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 0.046.sw),
          margin: EdgeInsets.symmetric(vertical: 0.053.sw),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  selected.value = !selected.value;
                },
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: selected.value
                          ? (todo.category == "personal"
                              ? AppColors.kprimary
                              : AppColors.kValue1)
                          : AppColors.kWhite,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: (todo.category == "personal"
                              ? AppColors.kprimary
                              : AppColors.kValue1),
                          width: 2)),
                  child: selected.value
                      ? Icon(
                          Icons.check,
                          size: 15,
                          color: AppColors.kWhite,
                        )
                      : null,
                ),
              ),
              0.046.sw.horizontalSpace,
              Text(todo.title,
                  style: TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
    // }
  }

  Widget MenuButton(String optionName, icon) {
    return Container(
      // color: Colors.red,
      height: 0.032.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            '$icon',
            // scale: 4,
            height: 0.025.sh,
            width: 0.046.sw,
            color: AppColors.kWhite,
          ),
          0.02.sw.horizontalSpace,
          Text("$optionName",
              style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
