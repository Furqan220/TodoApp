import 'package:todo_app/export_all.dart';
import 'package:image_picker/image_picker.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Icon(Icons.filter_list,color: kBlack,),
            Text("Tasks To Do",style: TextStyle(
              color: kBlack,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            CircleAvatar(
              radius: 15,

            )
          ],
        ),

        



      ),


body: ListView(
  padding: EdgeInsets.symmetric(horizontal: 0.055.sw),
  children: [

    0.032.sh.verticalSpace,
    Container(

      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15,
            offset: Offset(0, 5)
          )
        ]
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.023.sw),
          hintText: 'Search tasks ...',
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey,
            
          ),

          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    )
  ],
),

    );
  }
}