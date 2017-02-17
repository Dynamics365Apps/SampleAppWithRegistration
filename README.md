# SampleAppWithRegistration
Sample App with Registration

##How to use this sample app?

### What is in this package
In the package, you can find:
- Appfiles: the delta files
- Appfiles_Reverse: the reverse deltas
- Packages: all the navx files that were build during the development process
- PowerShell Scripts: the scripts that were used to manage this app
- Split: the split txt files of the modified objects
- HelloWorld_OnlyModified.fob: the fob file of the modified objects
- HelloWorld_OnlyModified.txt: the joined txt file of the modified objects

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
### Simply upload the deltas into your own environment
To simply upload the deltas in your own DEV database, execute this in PowerShell:

```
Apply-NAVDelta -DeltaPath $DeltaPath `
    -TargetServerInstance <TheServiceInstanceOfYourDEVDB> `
    -Workingfolder <ALocalFolderWhereObjectsCanBeSavedTemporarily> `
    -OpenWorkingfolder `
    -SynchronizeSchemaChanges Force `
    -DeltaType Add `
    -VersionList 'HelloWorld' 
```

*Remark: this commandlet is based on the modules, described above.*

### Use the PowerShell scripts that are part of this app
if you would like to set up your own development environment based on the scripts and go from there, you can simply follow the directions described in the readme.md here:
<https://github.com/waldo1001/Cloud.Ready.Software.PowerShell/blob/master/PSScripts/NAV%20Extensions/README.md>

It basically comes down to:
- Installing the modules (read above)
- executing the provided scripts one-by-one