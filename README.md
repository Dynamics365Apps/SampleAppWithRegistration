# SampleAppWithRegistration
The sample app is a simple "Hello World" app.  You can extend this app with "registration" possibilities, if you import the Registration objects.

##How to use these samples?

### What is in this package
In the package, you can find two folders:
- HelloWorld: Contains objects of an example-app 
    - Appfiles: the delta files
    - Appfiles_Reverse: the reverse deltas
    - PowerShell Scripts: the scripts that were used to manage this app
    - Split: the split txt files of the modified objects
    - HelloWorldApp_OnlyModified.fob: the fob file of the modified objects
    - HelloWorldApp_OnlyModified.txt: the joined txt file of the modified objects
- Registration: Contains objects of the registration functionality
    - Appfiles: the delta files
    - Appfiles_Reverse: the reverse deltas
    - PowerShell Scripts: the scripts that were used to manage this app
    - Split: the split txt files of the modified objects
    - Registration_OnlyModified.fob: the fob file of the modified objects
    - Registration_OnlyModified.txt: the joined txt file of the modified objects

The idea is that you would be able to combine this, to enable registration-functionality in the HelloWorld App.

### Recommended prerequisites
The PowerShell scripts are based on these modules:
- Cloud.Ready.Software.NAV
- Cloud.Ready.Software.PowerShell
- Cloud.Ready.Software.Windows
- Cloud.Ready.Software.SQL
it is recommended to install these modules.  You can do that by getting the from the PowerShell Gallery, by executing this in PowerShell:
```
Find-module | Where Author -eq waldo | install-module
```
### How to enable the HelloWorld App with registration possibilities
To do this, we need to combine both folders (HelloWorldApp and Registration) into one app.  
You would also be able to apply the "registration" functionality to your own app the same way as it is explain in the next paragraphs.
#### Step 1: Set up the HelloWorld DEV environment
Remark: You can skip this part if you are applying the registration functionality to your own app.

To simply upload the deltas in your own DEV database, execute this in PowerShell:

```
Apply-NAVDelta -DeltaPath "<PathToTheHelloworldApp>\AppFiles\*.DELTA" `
    -TargetServerInstance "<TheServiceInstanceOfYourDEVDB>" `
    -Workingfolder "<ALocalFolderWhereObjectsCanBeSavedTemporarily>" `
    -OpenWorkingfolder `
    -SynchronizeSchemaChanges Force `
    -DeltaType Add `
    -VersionList 'HelloWorldApp' 
```

*Remarks:*
*- this commandlet is based on the modules, described above.*
*- the compilation results in an error, as there is one object that references to the Registration-functionality.  That object acts as the interface-codeunit that connects the two functionalities.*

#### Step 2: Import the Registration functionality
Because the Registration App only contains new objects, you can simply import the fob-file (Registration_OnlyModified.fob) under the Registration folder.
In your final app, you probably need to renumber the objects to the ones in your 70-million range.  A description on how to do this can be found here: <https://blogs.msdn.microsoft.com/freddyk/2017/02/28/renumbering-nav-object-ids/> .

#### Step 3: Make the connection between your App and the Registration functionality
You can find an example of how you can connect your app with the registration functionalities in codeunit 50010 (HW REG Integration) in the HelloWorldApp.  Basically, all is done by checking the AccessLevel and providing the required access level.  If the access level is not met, the function "CheckCurrentAccessLevel" will return false and you can act accordingly (In case of the HelloWorldApp example, it will set "handled" to true (which means it's not going to execute the original method), and the registration app will show a notification).
Please, make sure the integration codeunit is using the right AppId (same one as used in the manifest of your app).  You probably need to change this!

### Use the PowerShell scripts that are part of this app
If you would like to set up your own development environment based on the scripts and go from there, you can simply follow the directions described in the readme.md here:
<https://github.com/waldo1001/Cloud.Ready.Software.PowerShell/blob/master/PSScripts/NAV%20Extensions/README.md>

It basically comes down to:
- Installing the modules (read above)
- executing the provided scripts one-by-one (Helloworld)