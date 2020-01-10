# Changelog

All notable changes to this project will be documented in this file.

## Release 0.1.2
**Bugfixes**
- The event logging implementation was incorrect. Although it defaults to `true`, it was actually setting the reg value to `0` which is "Do not log". This has been corrected to simply take an integer value allowing the user to set the logging level as needed (0-7).

## Release 0.1.1
- pdk 1.13.0 update
- add license file

## Release 0.1.0

**Features**

**Bugfixes**

**Known Issues**
