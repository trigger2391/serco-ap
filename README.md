# Disable Exclusive Control

This script is meant to disable the windows setting for allow apps to take exclusive control of audio devices.

The script has the following workflow.

1. Install Dependencies (Completed)
2. Pull GUID of current Default Audio Device and Default Communications Device (Awaiting Testing)
3. Store the GUID into a variable (Awaiting Testing)
5. Use the variable to apply the regkey setting to the Playback and Capture settings for the device (Awaiting Testing)

Packaging (After testing has confirmed script works reliably)
1. Write Auto_logon Script (WIP)
2. Package serco-ap_disable_exclusive_control and Auto_logon into .intunewin application (WIP)
3. Test Deployment
4. Full Deployment


