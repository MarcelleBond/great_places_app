# Great Places App

Great Places is a mobile application written in Flutter that allows users to take pictures of places or anything they like, and then add a location and description to the photo. This app also uses the Google Maps API to show the location of the place where the picture was taken. The app also stores the path to the images and other details in a SQLite database.

## Features

- Take pictures of places and add a location and description
- View all pictures with their location on Google Maps
- Add, edit, and delete places
- Store images and details in a SQLite database
- Works offline

## Requirements

- Flutter SDK
- Android Studio / Xcode
- Google Maps API Key
- SQLite database

## Installation

1. Clone the repository to your local machine
2. Run `flutter pub get` to install the dependencies
3. Add your Google Maps API key in the `AndroidManifest.xml` and `Info.plist` files
4. Run `flutter run` to launch the app on your emulator or physical device

## How to Use

1. Open the app and click on the "Add Place" button
2. Take a picture or choose one from your gallery
3. Add a location and description for the picture
4. Save the place and it will be added to the list of places
5. Click on a place in the list to view its location on Google Maps
6. Edit or delete a place from the list

## Contributing

Contributions are welcome! If you have any feature requests, bug reports, or pull requests, please open an issue or a pull request on the Github repository.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
