import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';

// ignore: must_be_immutable
class GenderPickerWithImage extends StatefulWidget {
  // optional: selectedGender can be null: if null, by default nothing will be selected
  Gender selectedGender;

  // to align title under picture, set true
  final bool verticalAlignedText;

  // gradient color of highlighting text
  final LinearGradient linearGradient;

  // to show images to respectively
  final ImageProvider maleImage;
  final ImageProvider femaleImage;
  final ImageProvider otherGenderImage;

  // on selection of gender changed
  final ValueChanged<Gender> onChanged;

  // Title of gender
  final String maleText;
  final String femaleText;
  final String otherGenderText;

  // alignment and difference between each item
  final bool equallyAligned;

  // size of gender icon
  final double size;

  // selection required circular or in square
  final bool isCircular;

  // padding of widget
  final EdgeInsetsGeometry padding;

  // time taken to show full opacity
  final Duration animationDuration;

  // required opacity of gradient color
  final double opacityOfGradient;

  // to define color of selected and unselected text
  final TextStyle selectedGenderTextStyle;
  final TextStyle unSelectedGenderTextStyle;

  // to show extra gender like shemale or Others
  final bool showOtherGender;

  GenderPickerWithImage({
    Key key,
    // by default selected color of selected gender text
    this.selectedGenderTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.redAccent,
      fontWeight: FontWeight.w600,
    ),
    // by default un-selected color of selected gender text
    this.unSelectedGenderTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),

    // bedefault verticallyaligned text is false to show in same row
    this.verticalAlignedText = false,

    // animation loading time by default set to [500 milliseconds]
    this.animationDuration = const Duration(milliseconds: 500),

    // by default gradient opacity set to 0.6
    this.opacityOfGradient = 0.6,
    // padding set to 10 from all side, you can also define yours
    this.padding = const EdgeInsets.all(10),

    // selection is in circular and can be in square as you needed
    this.isCircular = true,

    // default size of ImageIcon
    this.size = 40.0,

    // if alignment is true then everything will be in center
    this.equallyAligned = true,

    // to show selected Gender
    this.selectedGender = Gender.Male,

    // OnChanged is mandatory to implement, so ca change state of widget
    @required this.onChanged,

    // by default gradient color
    this.linearGradient = const LinearGradient(
        colors: [Color(0xFF3271a8), Color(0xFF8b32a8)],
        tileMode: TileMode.clamp,
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.0, 1.0]),
    this.showOtherGender = false,

    // Images asset can be network images,
    this.maleImage =
        const AssetImage("assets/images/male.png", package: 'gender_picker'),
    this.femaleImage =
        const AssetImage("assets/images/female.png", package: 'gender_picker'),
    this.otherGenderImage =
        const AssetImage("assets/images/shemale.png", package: 'gender_picker'),

    // by default text to show
    this.maleText = "Male",
    this.femaleText = "Female",
    this.otherGenderText = "Other",
  }) : super(key: key);

  @override
  _GenderPickerWithImageState createState() => _GenderPickerWithImageState();
}

class _GenderPickerWithImageState extends State<GenderPickerWithImage> {
  @override
  Widget build(BuildContext context) {
    return widget.verticalAlignedText
        ? getVerticalAlignedView()
        : getHorizontalAlignedView();
  }

  Widget getVerticalAlignedView() {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: widget.padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: widget.equallyAligned
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedGender = Gender.Male;
                    if (widget.onChanged != null) {
                      widget.onChanged(widget.selectedGender);
                    } else {
                      return;
                    }
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: widget.size,
                          width: widget.size,
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          decoration: BoxDecoration(
                            shape: widget.isCircular
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                            image: DecorationImage(
                              image: widget.maleImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: AnimatedOpacity(
                            opacity: widget.selectedGender == Gender.Male
                                ? widget.opacityOfGradient
                                : 0.0,
                            duration: widget.animationDuration,
                            child: widget.selectedGender == Gender.Male
                                ? Container(
                                    decoration: BoxDecoration(
                                        gradient: widget.linearGradient,
                                        shape: widget.isCircular
                                            ? BoxShape.circle
                                            : BoxShape.rectangle),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.maleText,
                        style: widget.selectedGender == Gender.Male
                            ? widget.selectedGenderTextStyle
                            : widget.unSelectedGenderTextStyle)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedGender = Gender.Female;
                    if (widget.onChanged != null) {
                      widget.onChanged(widget.selectedGender);
                    } else {
                      return;
                    }
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: widget.size,
                          width: widget.size,
                          margin: const EdgeInsets.only(top: 20, bottom: 10),
                          decoration: BoxDecoration(
                              shape: widget.isCircular
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              image: DecorationImage(
                                  image: widget.femaleImage,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover)),
                          child: AnimatedOpacity(
                            opacity: widget.selectedGender == Gender.Female
                                ? widget.opacityOfGradient
                                : 0.0,
                            duration: widget.animationDuration,
                            child: widget.selectedGender == Gender.Female
                                ? Container(
                                    decoration: BoxDecoration(
                                        gradient: widget.linearGradient,
                                        shape: widget.isCircular
                                            ? BoxShape.circle
                                            : BoxShape.rectangle),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.femaleText,
                        style: widget.selectedGender == Gender.Female
                            ? widget.selectedGenderTextStyle
                            : widget.unSelectedGenderTextStyle)
                  ],
                ),
              ),
              widget.showOtherGender
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedGender = Gender.Others;
                          if (widget.onChanged != null) {
                            widget.onChanged(widget.selectedGender);
                          } else {
                            return;
                          }
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            fit: StackFit.loose,
                            children: <Widget>[
                              Container(
                                height: widget.size,
                                width: widget.size,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                decoration: BoxDecoration(
                                    shape: widget.isCircular
                                        ? BoxShape.circle
                                        : BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: widget.otherGenderImage,
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover)),
                                child: AnimatedOpacity(
                                  opacity:
                                      widget.selectedGender == Gender.Others
                                          ? widget.opacityOfGradient
                                          : 0.0,
                                  duration: widget.animationDuration,
                                  child: widget.selectedGender == Gender.Others
                                      ? Container(
                                          decoration: BoxDecoration(
                                              gradient: widget.linearGradient,
                                              shape: widget.isCircular
                                                  ? BoxShape.circle
                                                  : BoxShape.rectangle),
                                        )
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          Text(widget.otherGenderText,
                              style: widget.selectedGender == Gender.Others
                                  ? widget.selectedGenderTextStyle
                                  : widget.unSelectedGenderTextStyle)
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHorizontalAlignedView() {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: widget.padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: widget.equallyAligned
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedGender = Gender.Male;
                    if (widget.onChanged != null) {
                      widget.onChanged(widget.selectedGender);
                    } else {
                      return;
                    }
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: widget.size,
                          width: widget.size,
                          margin: const EdgeInsets.only(
                              top: 0, bottom: 0, right: 5.0),
                          decoration: BoxDecoration(
                            shape: widget.isCircular
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                            image: DecorationImage(
                              image: widget.maleImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: AnimatedOpacity(
                            opacity: widget.selectedGender == Gender.Male
                                ? widget.opacityOfGradient
                                : 0.0,
                            duration: widget.animationDuration,
                            child: widget.selectedGender == Gender.Male
                                ? Container(
                                    decoration: BoxDecoration(
                                        gradient: widget.linearGradient,
                                        shape: widget.isCircular
                                            ? BoxShape.circle
                                            : BoxShape.rectangle),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.maleText,
                        style: widget.selectedGender == Gender.Male
                            ? widget.selectedGenderTextStyle
                            : widget.unSelectedGenderTextStyle)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedGender = Gender.Female;
                    if (widget.onChanged != null) {
                      widget.onChanged(widget.selectedGender);
                    } else {
                      return;
                    }
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: widget.size,
                          width: widget.size,
                          margin: const EdgeInsets.only(
                              top: 0, bottom: 0, right: 5.0),
                          decoration: BoxDecoration(
                              shape: widget.isCircular
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              image: DecorationImage(
                                  image: widget.femaleImage,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover)),
                          child: AnimatedOpacity(
                            opacity: widget.selectedGender == Gender.Female
                                ? widget.opacityOfGradient
                                : 0.0,
                            duration: widget.animationDuration,
                            child: widget.selectedGender == Gender.Female
                                ? Container(
                                    decoration: BoxDecoration(
                                        gradient: widget.linearGradient,
                                        shape: widget.isCircular
                                            ? BoxShape.circle
                                            : BoxShape.rectangle),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                    Text(widget.femaleText,
                        style: widget.selectedGender == Gender.Female
                            ? widget.selectedGenderTextStyle
                            : widget.unSelectedGenderTextStyle)
                  ],
                ),
              ),
              widget.showOtherGender
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.selectedGender = Gender.Others;
                          if (widget.onChanged != null) {
                            widget.onChanged(widget.selectedGender);
                          } else {
                            return;
                          }
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            fit: StackFit.loose,
                            children: <Widget>[
                              Container(
                                height: widget.size,
                                width: widget.size,
                                margin: const EdgeInsets.only(
                                    top: 0, bottom: 0, right: 5.0),
                                decoration: BoxDecoration(
                                    shape: widget.isCircular
                                        ? BoxShape.circle
                                        : BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: widget.otherGenderImage,
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover)),
                                child: AnimatedOpacity(
                                  opacity:
                                      widget.selectedGender == Gender.Others
                                          ? widget.opacityOfGradient
                                          : 0.0,
                                  duration: widget.animationDuration,
                                  child: widget.selectedGender == Gender.Others
                                      ? Container(
                                          decoration: BoxDecoration(
                                              gradient: widget.linearGradient,
                                              shape: widget.isCircular
                                                  ? BoxShape.circle
                                                  : BoxShape.rectangle),
                                        )
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          Text(widget.otherGenderText,
                              style: widget.selectedGender == Gender.Others
                                  ? widget.selectedGenderTextStyle
                                  : widget.unSelectedGenderTextStyle)
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
