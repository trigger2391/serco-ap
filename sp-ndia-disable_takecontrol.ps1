# ==========================================
# Script Name: sp-ndia-disable_exclusive_control
# Author: Matthew Bernardin
# Date: 2026-01-23
# Version 0.1
# Description: Disables Take Exclusive Control setting for Headset devices and sets grants all apps microphone permissions
# ==========================================

# Install AudioDeviceCmdlet powershell module - https://github.com/frgnca/AudioDeviceCmdlets

Install-Module -Name AudioDeviceCmdlets -Force
Import-Module AudioDeviceCmdlets

# Retrieve Audio Device GUID's and pipe them to a variable

Get-AudioDevice -Playback | foreach-object $Default_AD_Playback
Get-AudioDevice -Recording | foreach-object $Default_AD_Recording  
Get-AudioDevice -PlaybackCommunication | foreach-object $Default_CD_Playback
Get-AudioDevice -RecordingCommunication | foreach-object $Default_CD_Recording

# Apply regkey to to disable Take Exclusive Control on Playback & Recording for Default Audio Device and Default Communications Device

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Playback\{$Default_AD_Playback}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture\{$Default_AD_Recording}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Playback\{$Default_CD_Playback}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture\{$Default_CD_Recording}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

# Experimental
# Autoset permission for all applications to use microphone

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Allow /f
