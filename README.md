
# DinDinn Task

Simply it's an animation task with networking and mocking.

## Archctecture 

DinDinn task built on 'Clean Arch.' as multi-projects to optimize the build time and separate the code base into 3 projects:

##### 1- DinDinn Resources bundle
contains the Images, Colors, and Strings. this subproject is utilizing the SwftGen to turn my assets into accessible objects.
easily(from customized templates and scripts) I can get generated image or Strings as following 
 
```swift
// using generated strings file
 label.text = AppStrings.appName
```
```swift
// using generated strings file
 imageView.image = DinDinnImages.logo.image
```
##### 2- DinDinn core-bundle
contains the commonly used extensions and data layer.
data layer includes the API calls, Repository, and models.

##### 3- DinDinn main bundle
contains the Domain and presentation layers.
The domain layer includes the use cases.

The presentation layer is built on VIPER design pattern while the navigation is being handled by the Wireframe concept. [Reference](https://m.oursky.com/viper-ios-app-beyond-mvc-mega-viewcontroller-e2b625ac58d5)

![grab-landing-page](https://github.com/melsheikh92/DinDinn/blob/master/sample.gif)


