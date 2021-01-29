fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios lint
```
fastlane ios lint
```
Does a static analysis of the project. Configure the options in .swiftlint.yml
### ios test_app
```
fastlane ios test_app
```
Test the application. Configure options in fastlane/Scanfile
### ios beta
```
fastlane ios beta
```
Build the application. Configure options in fastlane/Gymfile
### ios test_build_app
```
fastlane ios test_build_app
```
Test and build the application

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
