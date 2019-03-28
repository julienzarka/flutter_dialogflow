# Dialogflow v2 apis for flutter applications.

![Dialogflow](https://github.com/diegodalbosco/flutter_dialogflow/raw/master/dialogflow.png) 

## Installation

* Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_dialogflow_v2: ^0.1.0
```
* You can install packages from the command line:
  with Flutter:
```
$ flutter packages get
```

* Import it in your Dart code, you can use:
```
 import 'package:flutter_dialogflow_v2/flutter_dialogflow.dart';
```

## Usage

* [Dialogflow](https://dialogflow.com/) register and create new Agent
* Project Setup and Authentication
    * First of all, we need to create a Google Cloud Platform Project using [Console Google Cloud](https://console.cloud.google.com/)
    * Create or select an existing GCP project.
    * From the GCP console, go to APIs and Services and click on credentials. 
    * Click on Create credentials and choose Service account key.
    * Select your service account from the dropdown, choose JSON and click Create. This will download the JSON key to your computer. Save it securely.
    * We downloaded a JSON file with all our data.
* In your project create folder assets(folder name recommended optional)
* Move file json in your project in folder created
* open file pubspec.yaml
``` yaml
flutter:
  uses-material-design: true
  assets:
    - assets/your_file_downloaded_google_cloud.json
```
* Import dialogflow_v2
``` dart
import 'package:flutter_dialogflow_v2/dialogflow.dart';
```
* Code examples

``` dart
  AuthGoogle authGoogle = await AuthGoogle(fileJson: 'assets/your_file.json').build();
  Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
  AIResponse response = await dialogflow.detectIntent('Hello!');
```

* or if you simply want to simple query some text:
``` dart
  AuthGoogle authGoogle = await AuthGoogle(fileJson: 'assets/your_file.json').build();
  Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
  AIResponse response = await dialogflow.detectIntentFromText('Hello!');
```

* get text response
``` dart
  response.getMessage();
```

* or list of messages
``` dart
  response.getListMessage();
```
