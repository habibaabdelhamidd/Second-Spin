import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/screens/account/edit_account/edit_account.dart';
import 'package:graduation/screens/account/settings_account/settings_account.dart';
class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}
class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: theme.appBarTheme.iconTheme,
        title: Text(
          "Account",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: mediaquery.width*0.1,
          right: mediaquery.width*0.03,
          left: mediaquery.width*0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset("assets/image/profile.png"),
                  Text(
                    "Cody Fisher",
                    style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, EditAccount.routeName);
              },
              child: Container(
                margin: EdgeInsets.only(top: mediaquery.width*0.06,
                    bottom:mediaquery.width*0.06),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(
                        "assets/image/edit_profile.png",
                      ),
                      color: theme.primaryColor,
                    ),
                    SizedBox(
                      width:mediaquery.width*0.04,
                    ),
                    Text("Edit Profile",
                        style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16)),
                    Spacer(),
                    ImageIcon(AssetImage("assets/image/arrow.png")),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Settings_Account.routeName);
              },
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage(
                      "assets/image/Settings-.png",
                    ),
                    color: theme.primaryColor,
                  ),
                  SizedBox(
                    width:mediaquery.width*0.04,
                  ),
                  Text("Settings",
                      style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16)),
                  Spacer(),
                  ImageIcon(AssetImage("assets/image/arrow.png")),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                _showDialog(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: mediaquery.width*0.06,
                    bottom:mediaquery.width*0.06),
                child: Row(
                  children: [
                    Icon(Icons.feedback , color: theme.primaryColor,size: 30,),
                    SizedBox(
                      width:mediaquery.width*0.04,
                    ),
                    Text("feedbak", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16),),
                    Spacer(),
                    ImageIcon(AssetImage("assets/image/arrow.png"))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:mediaquery.width * 0.01
              ,left: mediaquery.width*0.01,
                right: mediaquery.width*0.01,
                bottom: mediaquery.width*0.04
              ),
              width: double.infinity,
              height: mediaquery.height * 0.002,
              color: Colors.grey.shade400,
            ),
            Row(children: [ImageIcon(AssetImage("assets/image/contact-us.png"), color: theme.primaryColor,),
              SizedBox(width:mediaquery.width*0.04,),
              Text("contactus", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16)),],),
            Container(
              margin:   EdgeInsets.only(left:mediaquery.width*0.08, top:mediaquery.width*0.03),
              child: Row(
                children: [
                  Icon(Icons.phone , color: Colors.grey.shade400,),
                  SizedBox(width:mediaquery.width*0.03),
                  Text("19911", style: theme.textTheme.bodyMedium),

                ],
              ),
            ),
            Container(
              margin:   EdgeInsets.only(left:mediaquery.width*0.08, top:mediaquery.width*0.03),
              child: Row(
                children: [
                  Icon(Icons.mail , color: Colors.grey.shade400,),
                  SizedBox(width:mediaquery.width*0.03),
                  Text("contact@SecondSpin.com ", style: theme.textTheme.bodyMedium),

                ],
              ),
            ),
            Container(
              margin:   EdgeInsets.only(left:mediaquery.width*0.08, top:mediaquery.width*0.03),
              child: Row(
                children: [
                  Icon(Icons.location_on , color: Colors.grey.shade400,),
                  SizedBox(width:mediaquery.width*0.03),
                  Text("Cairo , Egypt", style: theme.textTheme.bodyMedium),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:mediaquery.width * 0.04
                  ,left: mediaquery.width*0.01,
                  right: mediaquery.width*0.01,
                  bottom: mediaquery.width*0.04
              ),
              width: double.infinity,
              height: mediaquery.height * 0.002,
              color: Colors.grey.shade400,
            ),
            GestureDetector(
              onTap: (){
                showLogout(context);
              },
              child: Row(children: [ImageIcon(AssetImage("assets/image/Logout.png"), color: theme.primaryColor,),
                SizedBox(width:mediaquery.width*0.04,),
                Text("Logout", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16)),],),
            ),
            GestureDetector(
              onTap: (){
                showDelete(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: [
                  Icon(Icons.delete_outline , color: theme.primaryColor,),
                  SizedBox(width:mediaquery.width*0.04,),
                  Text("Delete Account", style: theme.textTheme.bodyLarge!.copyWith(fontSize: 16)),],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('User Feedback ',textAlign: TextAlign.center,),
            content:TextFormField(
              decoration: InputDecoration(
                hintText: "Describe here",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff7aab99),
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: Text("Done" , style: TextStyle(fontWeight: FontWeight.w600),),
              )
            ],
          );
        }
      );
    }
void showLogout(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout ',textAlign: TextAlign.center,),
          content:Text("Are you sure you want to logout?" , ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(right: 5 , bottom: 10),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color: Color(0xff7AAB99),
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text("Cancel"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5 , bottom: 10),
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        );
      }
  );
}
void showDelete(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete ',textAlign: TextAlign.center,),
          content: Text("Are you sure you want to delete your account?" , ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(right: 5 , bottom: 10),
                  decoration:BoxDecoration(
                      border: Border.all(
                        color: Color(0xff7AAB99),
                      ),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text("Cancel"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5 , bottom: 10),
                  child: Text("Logout"),
                ),
              ],
            ),
          ],
        );
      }
  );
}
