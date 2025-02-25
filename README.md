# TripTracker

## Overview
TripTracker is a real-time location-sharing app built using **SwiftUI** and **Firebase Realtime Database**. It allows multiple users to share their locations on a shared map, making it ideal for group trips. Users can see their own location and the real-time locations of others in the group.

## Features
- 📍 **Real-time location sharing** using Firebase Realtime Database.
- 🗺️ **MapView with live updates** to track other users.
- 👤 **Custom icons for different users** on the map.

## Pending Features (To-Do)
- 🔑 **User Authentication**: Implement authentication using Firebase Auth (Google, Apple, Email/Password).
- 🏕️ **Room Creation for Trips**: Allow users to create and join trip rooms so that only selected users can see each other.
- 🗺️ **Route Tracking**: Track and display the route taken by users during a trip.
- 🏁 **Trip History**: Store past trips and display a history of location movements.
- ⚙️ **Settings Panel**: Let users control visibility, map type, and tracking preferences.
- 🔔 **Push Notifications**: Alert users when someone enters or exits a specific area.

## Installation
### 1. Clone the repository
```sh
$ git clone https://github.com/yourusername/TripTracker.git
$ cd TripTracker
```

### 2. Install Dependencies
Ensure you have **CocoaPods** installed and run:
```sh
$ pod install
```

### 3. Open Xcode Workspace
```sh
$ open TripTracker.xcworkspace
```

### 4. Configure Firebase
- Go to [Firebase Console](https://console.firebase.google.com/)
- Create a new project
- Enable **Realtime Database**
- Download the `GoogleService-Info.plist` file and add it to the Xcode project

### 5. Run the App
```sh
$ xcodebuild build
```
Or run directly from **Xcode**.

## Technologies Used
- **SwiftUI** - For UI development
- **MapKit** - For displaying maps
- **Firebase Realtime Database** - For real-time location tracking
- **CoreLocation** - To access the user’s current location

## How It Works
1. **User Location Tracking:**
   - The app requests location permissions and starts tracking the user's location.
   - The current location is stored in Firebase and updated in real-time.

2. **Real-Time Updates:**
   - Other users' locations are fetched from Firebase and displayed on the map.
   - Icons differentiate users on the map.

## License
MIT License
