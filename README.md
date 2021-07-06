![Banar](https://user-images.githubusercontent.com/86293803/124567451-af9b3f80-de4c-11eb-8578-3fea570d8c5d.jpeg)

# Weather Forecast App

[![Vesion](https://img.shields.io/badge/Version-1.0-red.svg?style=flat-square)](https://gitlab.com/iJETadmin/ops-ios-app)
[![License](https://img.shields.io/badge/License-private-yellow.svg?style=flat-square)](https://gitlab.com/iJETadmin/ops-ios-app)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat-square&logo=apple)](https://gitlab.com/iJETadmin/ops-ios-app)
[![Xcode Version](https://img.shields.io/badge/Xcode-12.0-blue.svg?style=flat-square&logo=Xcode)](https://developer.apple.com/xcode/)
[![Swift Version](https://img.shields.io/badge/Swift-5.3-orange.svg?style=flat-square&logo=swift)](https://swift.org)

[![Fastlane](https://img.shields.io/badge/Fastlane-Avilabil-00F200.svg?style=flat-square&logo=fastlane)](https://swift.org)
[![CocoaPods](https://img.shields.io/badge/Fastlane-Avilabil-EE3322.svg?style=flat-square&logo=cocoapods)](https://swift.org)
[![Jazzy](https://img.shields.io/badge/Jazzy-Avilabil-BA478F.svg?style=flat-square&logo=apple-music)](https://swift.org)


Weather forecast is a native iOS application written in Swift. The app is a weather channel which has accurate weather information and forecasts weather daily & hourly. it depand on `wttr.in` api to fetch the weather forecasts for any country of you choice.

## Requirements
- Swift 5.3
- Xcode 12.0
- macOS 10.15 and above
- [Pod](https://cocoapods.org/) - A package manager
- [Jazzy](https://github.com/realm/jazzy) - A code documentation generator
- [Swiftlint](https://github.com/realm/SwiftLint) - A Swift code linter & fixer
- [Fastlane](https://docs.fastlane.tools/) - A deployments and releases tool

## Get Started

install cocoapods
```bash
gem install cocoapods
```
> you might need `sudo` to install.

install swift lint
```bash
brew install swiftlint
```
install jazzy
```bash
gem install jazzy
```

install fastlane
```bash
# install Xcode command tools if needed
xcode-select --install

gem install fastlane - NV
```
> you might need `sudo` to install.

Finally open `WeatherForecast.xcworkspace` and start development.

## Contributing
If you are new to this repository, please read [development doc](/documentation/Development.md) first, then you have to look at the [architecture doc](/documentation/Architecture.md). If you to look at the project documentation go to 
`<Project Directory>/doc/index.htm` and open it in browser.