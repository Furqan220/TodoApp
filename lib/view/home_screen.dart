import 'package:todo_app/export_all.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TasksController task = Get.put(TasksController());

//  double _value = 0.6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.filter_list,
              color: kBlack,
            ),
            Row(
              children: [
                Icon(
                  Icons.search_sharp,
                  color: kBlack,
                ),
                0.046.sw.horizontalSpace,
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: kprimary,
                )
              ],
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 0.055.sw),
        children: [
          0.032.sh.verticalSpace,
          Text("Whats'up Furqan",
              style: TextStyle(
                  color: kBlack, fontSize: 35.sp, fontWeight: FontWeight.bold)),
          0.021.sh.verticalSpace,
          Text("Categories".capitalize!,
              style: TextStyle(
                  color: kGrey, fontSize: 15.sp, fontWeight: FontWeight.w600)),
          0.021.sh.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              countBox(),
              countBox(
                task: "20",
                category: "Personal",
                valueColors: kprimary,
              ),
            ],
          ),
          0.032.sh.verticalSpace,
          Text("Today's Tasks",
              style: TextStyle(
                  color: kGrey, fontSize: 15.sp, fontWeight: FontWeight.w600)),
          0.021.sh.verticalSpace,
          ...List.generate(task.todaysTask.length,
              (index) => TaskTile(task.todaysTask[index].toString()))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kprimary,
        child: Icon(
          Icons.add,
          size: 30.sp,
        ),
      ),
    );
  }
}

Widget searchField() {
  return Container(
    decoration: BoxDecoration(
        color: kWhite,
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
          color: kGrey,
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
    {String task = '40', category = "Business", Color valueColors = kValue1}) {
  return Container(
    width: 0.42.sw,
    padding: EdgeInsets.symmetric(horizontal: 0.046.sw, vertical: 0.016.sh),
    decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(66, 19, 19, 75),
              blurRadius: 15,
              offset: Offset(0, 5))
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$task tasks",
          style: TextStyle(
              fontSize: 16.sp, color: kGrey, fontWeight: FontWeight.w500),
        ),
        0.021.sh.verticalSpace,
        Text(
          "$category",
          style: TextStyle(
              fontSize: 20.sp, color: kBlack, fontWeight: FontWeight.bold),
        ),
        0.032.sh.verticalSpace,
        LinearProgressIndicator(
          value: 0.7,
          backgroundColor: kGrey,
          color: valueColors,
        ),
        0.021.sh.verticalSpace,
      ],
    ),
  );
}

Widget TaskTile(String TaskName) {
  return Slidable(
    direction: Axis.horizontal,
    endActionPane: ActionPane(motion: ScrollMotion(), children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.edit,
          color: kprimary,
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
    child: Container(
      // color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 0.046.sw),
      margin: EdgeInsets.symmetric(vertical: 0.053.sw),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kprimary, width: 2)),
          ),
          0.046.sw.horizontalSpace,
          Text(TaskName,
              style: TextStyle(
                  color: kBlack, fontSize: 22.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    ),
  );
}
