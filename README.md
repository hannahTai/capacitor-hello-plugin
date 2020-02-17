# Custom Capacitor Plugin
A brief note for custom capacitor plugin.



## Before You Start
Make sure your Ionic project could run on browser and emulator.
- Run `ionic serve`
- Run `ionic cap run android -l --external`. (Run `ionic build` at least once before.)
- Run `ionic cap run ios -l`. (Run `ionic build` at least once before.)



## Generate Capacitor Plugin
Where you want to place the custom plugins and under Ionic project, run `npx @capacitor/cli plugin:generate`.
- Plugin NPM name (kebab-case): capacitor-hello-toast
- Plugin id (domain-style syntax. ex: com.example.plugin) com.example.plugin
- Plugin class name (ex: AwesomePlugin) HelloToastPlugin
- description: A simple custom toast capacitor plugin for the starter.
- git repository: https://github.com/hannahTaiWork/capacitor-hello-plugin.git
- author: Hannah
- license: MIT
- package.json will be created, do you want to continue? (Y/n) Y



## Custom Native Code
#### Interface 
- Declare plugin methods at [sample-ionic-project/custom_plugins/capacitor-hello-toast/src/definitions.ts] and [sample-ionic-project/custom_plugins/capacitor-hello-toast/ios/Plugin/Plugin.m].

#### Android
Write native android code at [sample-ionic-project/custom_plugins/capacitor-hello-toast/android/src/main/java/com/example/plugin/HelloToastPlugin.java].

#### iOS
Write native iOS code at [sample-ionic-project/custom_plugins/capacitor-hello-toast/ios/Plugin/Plugin.swift].

#### Web
Write web code at [sample-ionic-project/custom_plugins/capacitor-hello-toast/src/web.ts].



## Install & Register 
#### Install in the Ionic Project
- Run `npm i file:./custom_plugins/capacitor-hello-toast` in your Ionic project.
- Use `npx cap sync` for a new plugin or `npx cap update` for an update.

#### Register the plugin in your Activity for Android
- Open [sample-ionic-project/android/app/src/main/java/io/ionic/starter/MainActivity.java]
- `import com.example.plugin.HelloToastPlugin;`
- Add `add(HelloToastPlugin.class);` in onCreate method
 
#### Register the plugin in your Activity for Web
- Open [sample-ionic-project/src/app/app.component.ts]
- `import { registerWebPlugin } from '@capacitor/core';`
- `import { HelloToastPlugin } from '../../custom_plugins/capacitor-hello-toast/src';`
- Add `registerWebPlugin(HelloToastPlugin);` in initializeApp method



## Usage
- `import { Plugins } from '@capacitor/core';`
- `const { HelloToastPlugin } = Plugins;`
- Call HelloToastPlugin's method
  ```
  HelloToastPlugin.showToast({ data: 'Valentino' }).then(
    (value) => {
      // success
    },
    (reason) => {
      // fail
    });
  ```
