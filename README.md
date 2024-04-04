# final_project

This project provides an example flutter app which can be used to exflitrate sensor data from a device. Currently the data is stored in the `Downloads` folder on the local device and has to be extraceted somehow by the attacker.

## Why

Sensor data is not considered sensitive by most platforms so a user isnt explicitly notified by the system when an app tries to access accelerometer data for example (as opposed to something like the camera). This assumed trust can be used by an attacker to exfiltrate this data without the victims knowledge and analyse it to spy on the user and determine what they were doing (walking,running, taking a call etc...)

## Setup

### Setup flutter

Follow https://docs.flutter.dev/get-started/install/linux/android?tab=download to set up flutter for your system

### Configure IDE

Install the `Flutter` extension for VS Code

### Run the app

The app can be run in several different ways. For testing purposes the app can be run on an emulator or a connected phone using `flutter run`. In order to launch the attack in the wild the app can also be compiled into an APK/Bundle and distributed through the App/Play stores. For example:
`flutter build apk --split-per-abi`
More information can be found in https://docs.flutter.dev/deployment/android

# sensor_python

This project is built to take in sensor data generated using `final_project` and output graphs to analyze the data. This project also assumes you are using (and have installed) Visual Studio Code. The acceleromenter data will have to be obtained somehow by the attacker from the target device.

## Setup

### Install dependencies

```
pip install notebook matplotlib pandas
Install python and jupyter extensions in vscode
```

### Setup jupyter notebook

1. Set jupyter notebook password `jupyter notebook password`
2. Start up notebook `jupyter notebook`
3. Log into notebook and set vscode to use it a. Press select kernel button in VScode and type in the URL of your server (e.g. `http:/localhost:8888`) b. Log in with your password and select the kernel you want to use

## Analyzing data

### Modify file

Using the inbuilt find and replace function in VScode the following parts of the file should be remove from all lines

```
[AccelerometerEvent (x:
y: 
z: 
)]
```

### Perform analysis

After the file has been modified it can be imported into the jupyter notebook and each individual cell pressed to create the x y and z graphs. These in turn can be used to work out what a user was doing at a particular time (walking, running, taking a phonecall etc...)