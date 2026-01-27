# ==========================================
# Script Name: sp-ndia-disable_exclusive_control
# Author: Matthew Bernardin
# Date: 2026-01-23
# Version 0.1
# Description: Disables Take Exclusive Control setting for Headset devices to improve Amazon Connect Functionality
# ==========================================

# Install AudioDeviceCmdlet powershell module 
# Cmdlet hosted at https://github.com/frgnca/AudioDeviceCmdlets

Install-Module -Name AudioDeviceCmdlets -Force
Import-Module AudioDeviceCmdlets

# Variable Declarations

$Default_AD = ""
$Default_CD = ""

# Retrieve Audio Device GUID's and pipe them to variable

Get-AudioDevice -List | foreach-object $Default_AD
Get-AudioDevice -List | foreach-object $Default_CD  

# Apply regkey to Default Audio Device and Default Communications Device that was previously pulled from OS

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture\{$Default_AD}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Playback\{$Default_AD}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture\{$Default_CD}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

$regPath = "HKLM:\S0FTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Playback\{$Default_CD}\Properties New-ItemProperty" 
$key = "b3f8fa53-0004-438e-9003-51a46e139bfc"
New-ItemProperty -Path $regPath -Name $key -Value 0 -PropertyType DWORD

