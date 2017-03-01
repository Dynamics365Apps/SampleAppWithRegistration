#The app
$AppName = 'HelloWorldApp'
$AppPublisher = 'Cloud Ready Software GmbH'
$AppDescription = 'A Hello World App, that will be used to demonstrate how to include the Registration-functionality.'
$InitialAppVersion = '1.0.0.0'
$IncludeFilesInNavApp = ''
$WebServicePrefix = 'REG'

#The build environment
$WorkingFolder = 'C:\_Workingfolder'

$OriginalServerInstance = "Shared_ORIG"
$ModifiedServerInstance = "$($AppName)_DEV"
$TargetServerInstance = "Shared_TEST"
$TargetTenant = 'Default'
$License = "C:\Users\Administrator\Dropbox\Dynamics NAV\Licenses\2017 DEV License.flf"
$ISVNumberRangeLowestNumber = 50000

#Defaults
$DefaultServerInstance = 'DynamicsNAV100'
$NavAppWorkingFolder = join-path $WorkingFolder $AppName
$BackupPath = [io.path]::GetFullPath((Join-Path $PSScriptRoot '\..\'))

#Run Test
$TestWindowsClient = $false
$TestWebClient = $true
$TestTabletClient = $false
$TestPhoneClient = $false