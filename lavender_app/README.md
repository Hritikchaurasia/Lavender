# LAVENDER 📺

A fully-functional video streaming app like netflix made in **Flutter** using **Custom Nodejs backend**.

# How To Run This Project 🏃‍♂️
1. Clone the repository.
2. Do `flutter pub get`.


# Features 🚀
1. User can watch live tv.  
2. User can watch latest Movies and series.
3. Get to know about all the upcoming movies/series.

# Built With 🛠
- [Flutter](https://flutter.dev/) - UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.
- [http](https://pub.dev/packages/http) - A composable, Future-based library for making HTTP requests. 
- [Bloc](https://pub.dev/packages/bloc) - A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.
- [equatable](https://pub.dev/packages/equatable) - A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.
- [yoyo_player](https://pub.dev/packages/yoyo_player) - yoyo_player is a video player that allows you to select HLS video streaming by selecting the quality
- [lottie](https://pub.dev/packages/lottie) - To implement lottie animation.

# Package Structure 🗼

    lib # Root Package

    ├── data                         #data layer
    |   ├── channels                 #channels    
    |   │   ├── channel              #channel model      
    |   │   └── language             #language model       
    │   ├── comming_soon  
    |   |   └── comming_soon         #comming_soon model
    │   ├── movies  
    |   |   ├── movies_categories    #movies_categories model
    |   |   └── movies               #movie model
    │   └── series
    |       ├── episode              #episode model
    |       ├── seasons              #season model
    |       ├── series_categories    #series_categories model
    |       └── series               #series model      
    |                  
    ├── domain                       #connect data layer with ui layer
    |   └── repositories             #single source of truth 
    |       └── network_repo         #handel api request 
    |
    ├── presentation                 #ui layer
    |    ├── bloc                    #state management   
    |    ├── pages                   #app screens 
    |    └── widgets                 #widgets
    |
    ├── utils                        #utility
    |   └── constants                #contain constants
    |                          
    └── main.dart                    #entry point

# Architecture 🏹
This app uses **Clean Architecture**.


![Clean Architecture](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1).

# Features Under Progress 🐌
1. Web support.

# Platform Supported 💻📱

- [x] Android
- [x] IOS

