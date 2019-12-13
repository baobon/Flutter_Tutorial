Go to site  -> https://firebase.google.com -> Creat Project

Visual-Code -> app-> src-> build.gradle ->  applicationId copy this -> "com.example.firebase_tutorial"

Firebase -> 
* Step 1: Register Android App 
		+ Paste -> Android package name
		+ App nickname -> Firebase Tutorial -> Register App
* Step 2: Dowload config file -> Dowload google-services.json -> Copy google-services to Visual-Code : app (src/build.gradle)

* Step 3: Add Firebase SDK -> Visual-Code -> 
+ build.gradle (<project>/build.gradle):
 dependencies {
    classpath 'com.google.gms:google-services:4.3.2'
  }
+ build.gradle (<project>/<app-module>/build.gradle):
	// Add to the bottom of the file
	apply plugin: 'com.google.gms.google-services'  

* Step 4: -> OK  


Visual-Code : 
	cd -> pubspec.yaml -> sdk add new -> firebase_auth: ^0.15.2   		***Firebase Auth***
				""					  -> cloud_firestore: ^0.13.0+1 	***Cloud Firestore***








