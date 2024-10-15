# Animations button

![Static Badge](https://img.shields.io/badge/3.4.3-7CB9E8?style=flat&logo=dart&logoColor=white&label=Dart&labelColor=042B59&color=7CB9E8)    ![Static Badge](https://img.shields.io/badge/3.24.0-7CB9E8?style=flat&logo=flutter&logoColor=white&label=Flutter&labelColor=042B59&color=7CB9E8)


The button_animations is a package to make highly customizable Flutter widgets 
with highlight animations in background .

## Getting Started
To use this plugin, add the latest version of **animation_button:** as a dependency
in your **pubspec.yaml** file.

**Platform Support** 


# Platform Support

This Flutter package supports the following platforms:

| Platform            | Support Status | Notes                           |
|---------------------|:---------------|:--------------------------------|
| Android             | ✅ Supported    | Compatible with Android 4.1+    |
| iOS                 | ✅ Supported    | Requires iOS 9.0 or later       |
| Web                 | ✅ Supported    | Fully functional on web         |
| macOS               | ✅ Supported    | Requires macOS 10.11 or later   |
| Windows             | ✅ Supported    | Requires Windows 10 or later    |
| Linux               | ✅ Supported    | Requires GTK 3.10 or later      |


### Support Status
- ✅ Supported: The platform is fully supported and tested.



    
## Button Parameters and their Description

| Datatype |               Parameter               | Required |   Default Value   |                               Description                               |
|:--------:|:-------------------------------------:|:--------:|:-----------------:|:-----------------------------------------------------------------------:|
| function |               onPressed               |   Yes    |        --         | The function that is <br/> called whenever<br/> the widget is OnPressed |
|  String  |                 title                 |   Yes    |        --         |                             Title of Button                             |
|  double  |          buttonBorderRadius           |    No    |       50.0        |                 The radius of the borders of the button                 |
|  Color   |         buttonBackgroundColor         |    No    | Color(0xFFCCD5AE) |                   The background color of the button                    |
|  Widget  |             iconNextTitle             |    No    | SizedBox.shrink() |                    widget added beside button title                     |
|  double  |             initialWidth              |    No    |       250.0       |                         The width of the button                         |
|  double  |             initialHeight             |    No    |       50.0        |                        The height of the button                         |
| Duration |       animatedContainerDuration       |   Yes    | milliseconds: 300 |                   The Duration Of Animated Container                    | 

