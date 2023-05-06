# DOCTOR APP
_Doctor app is a mobile application built with Flutter that allow users to add, update, and delete a doctor and its information. Users can also add or remove a doctor from the list of favorites. This app uses the reqres API._
# Other Features includes:
- HTTP REQUEST (GET,POST,PUT,DELETE)
- Displays the list of users from the API.
- Sorting/Filtering by doctor type for easier viewing of doctors.
- Search functionality by doctor type or name.
- Viewing doctor information.
- Local Storage to save users from the API.
- Unit and Widget Testing.

# STATE MANAGEMENT 
_The app uses the Bloc state management pattern to manage its state, which helps keep the code organized and maintanable as the app grows._

# ARCHITECTURE
_The app uses a combination of Flutter Bloc Architecture and Clean Architecture which helps to keep the code organized and maintenable as the app grows._

# How to Setup the Project

## Installing Flutter on windows

Follow guide from the official documentation if needed [official guide](https://docs.flutter.dev/get-started/install/windows).

## Install FVM
In order to run the project, you need to install FVM (Flutter Version Management).
Follow guide from the official documentation if needed [official guide](https://fvm.app/docs/getting_started/installation/).

## Install the latest Flutter Stable Version (3.17.12)

using command: `fvm install 3.7.12`. 

## Run the command to use the Flutter Version.

`fvm use 3.7.12`

## Run the command to update packages.

`fvm flutter pub get`

## Run the app using the command `fvm flutter run`
