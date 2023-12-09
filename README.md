# SDN final project

## Setup
Installation steps for setting up the required tech stack for building and running this project are as follows in the same order:

### Flutter:
To set up Flutter for the application, follow the instructions provided here [Flutter documentation](https://docs.flutter.dev/get-started/install).

### Andriod Studio:
You need to set up Android Studio and the command-line tools for the Android SDK after setting up Flutter.

Steps:

1) Install and configure [Android Studio](https://developer.android.com/studio/install).

2) Download and setup the command-line-tools by following these steps:

    a) Open android-studio
    b) Click on the "More Actions" option on the boot window. Select SDK Manager from the options it shows.
    c) In the "Android SDK" section, go to the SDK Tools section.
    d) Check the box for "Android SDK Command-line Tools (latest)" and click ok

3) Running "flutter doctor" to check the setup of flutter android licenses. However, upon running this, it may ask you to agree/disagree with some licenses. Run the following command to fix this:
```
flutter doctor --android-licenses
```
## Running the application 
This can be done in two ways:

1) Setup an [android emulator](https://developer.android.com/studio/run/managing-avds).
2) For running on your local Android device requires activating USB-debugging in the developer options. Use this [link](https://developer.android.com/studio/run/device) as a reference to do so.

Setup for Flutter is accomplished

## Clone the project

Clone the project from the [repository](https://github.com/Y09mogal/SDN_NFV_OAuth_Project) link.

## Steps to run the App:
1) Start the emulator or connect or Android mobile with your laptop and allow for USB debugging as discussed above.
2) Run the application using the following command:
```
flutter run
```
3) Select the device you want to run the application on.


