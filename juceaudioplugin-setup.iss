; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define public Dependency_NoExampleSetup 
#include "./scripts/CodeDependencies.iss"

#define MyAppName "JuceAudioPlugin"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "bsnacks000"
#define MyAppURL "https://www.example.com/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{08421675-5EC0-4E67-9791-6D4D1A99D763}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
; Default for VST3
DefaultDirName={autopf}\Common Files\VST3\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.
OutputBaseFilename=juceaudioplugin-setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
; this is needed to assure 64 bit install 
ArchitecturesInstallIn64BitMode=x64 

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

; Our boi analog-obsession takes the entire `.vst3` dir so we do as well... Probably the .vst3 dll would be ok as well.
[Files]
Source: ".\build\JuceAudioPlugin_artefacts\Release\VST3\JuceAudioPlugin.vst3\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


; Below code assures VC is up to date on target.  
[Code]                                            
function InitializeSetup: Boolean;                
begin                                             
  Dependency_AddVC2015To2022;                     
  Result := True;                                 
end;                                              