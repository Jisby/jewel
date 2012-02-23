Instructions for running JewelWarrior on Android
================================================

1. Follow the Phonegap Getting Started Guide at the following link.
http://docs.phonegap.com/en/1.4.1/guide_getting-started_android_index.md.html#Getting%20Started%20with%20Android

2. When Eclipse, Android SDK and related software is installed, checkout the project source.
$ git clone git@bitbucket.org:dbouianov/jewel.git

3. Start Eclipse, choose a workspace directory and import existing project into the workspace.
Eclipse Toolbar -> File -> Import... -> Existing Projects into Workspace -> Next -> Select root directory -> Browse -> JewelWarrior -> Next

4. Run make to compile LESS source files into CSS and to COFFEE source files into JS.
$ cd android/JewelWarrior/src/styles
$ ../../build/build.sh install

$ cd android/JewelWarrior/src/scripts
$ ../../build/build.sh install

The commands above will place the compiled *.css and *.js files into the Phonegap's assets/www directory.

5. Start an HTTP server to test the game locally n the browser.
$ cd android/JewelWarrior/assets/www
$ python -m SimpleHTTPServer

After the HTTP server is started, open http://localhost:8000 to interact with the application.
Use FireBug for Firefox, Developer Tools for IE or Developer Tools for Chrome to debug the application.

6. Run the game from Eclipse as an Android application.

Eclipse Toolbar -> Run -> Run As -> Android Application

If the application doesn't launch the first time you start an Android Emulator, try again.
