import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gender Picker',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Gender Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Horizontal Aligned",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            getWidget(false, false),
            Divider(),

            Container(
              child: Text(
                "Vertical Aligned",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            getWidget(false, true),
            Divider(thickness: 8.0,),
            Container(
              child: Text(
                "Optional Other Gender\n",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
              ),
            ),


            // If you want to show 3rd optional gender
            Container(
              child: Text(
                "Horizontal Aligned",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            getWidget(true, false),
            Divider(),

            Container(
              child: Text(
                "Vertical Aligned",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            getWidget(true, true),
            Divider(),

          ],
        ),
      ),
    );
  }
  
  Widget getWidget(bool showOtherGender, bool alignVertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: showOtherGender,
        verticalAlignedText: alignVertical,
        
        // to show what's selected on app opens, but by default it's Male
        selectedGender: Gender.Male,
        selectedGenderTextStyle: TextStyle(
            color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal),
        onChanged: (Gender gender) {
          print(gender);
        },
        //Alignment between icons
        equallyAligned: true,
        
        animationDuration: Duration(milliseconds: 300),
        isCircular: true,
        // default : true,
        opacityOfGradient: 0.4,
        padding: const EdgeInsets.all(3),
        size: 50, //default : 40
      ),
    );
  }
}
