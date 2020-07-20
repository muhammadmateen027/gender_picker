# gender_picker 1.0.4

An awesome gender picker widget comes with latest feature to support in your project design.

The goal of this project is to provide an ultimate widget for selecting the gender.

The source code is 100% Dart, and everything resides in the /lib folder.

![Screenshot_20200314_120050_com mateen example](https://user-images.githubusercontent.com/24449076/76674642-b1ece100-65ec-11ea-80a6-3327ac72b4d3.jpg)

## Installing
Add this to your package's pubspec.yaml file:

dependencies:
``` gender_picker: ^1.0.2 ```


## Sample Usage
```
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
GenderPickerWithImage(
              showOtherGender: true,
              verticalAlignedText: false,
              selectedGender: Gender.Male,
              selectedGenderTextStyle: TextStyle(
                  color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
              unSelectedGenderTextStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
              onChanged: (Gender gender) {
                print(gender);
              },
              equallyAligned: true,
              animationDuration: Duration(milliseconds: 300),
              isCircular: true,
              // default : true,
              opacityOfGradient: 0.4,
              padding: const EdgeInsets.all(3),
              size: 50, //default : 40
            )
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
