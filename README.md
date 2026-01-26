# Disable Exclusive Control

This script is meant to disable the windows setting for allow apps to take exclusive control of audio devices.

The script has the following workflow.

1. Install Dependencies (WIP)
2. Pull GUID of current Default Audio Device and Default Communications Device
3. Route the GUID of DAD and DCD to a variable
4. Use the variable to check and apply a reg_entry disabling the option


