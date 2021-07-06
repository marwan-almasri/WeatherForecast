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
If you are new to this repository, please read [this](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3) Medium Post first about __Clean Architecture + MVVM__ , then you have to look at the project documentation go to 
`<Project Directory>/doc/index.htm` and open it in browser.

## Architecture

As we can see in Clean Architecture graph, we have different layers in the application. The main rule is not to have dependencies from inner layers to outers layers. The arrows pointing from outside to inside is the Dependency rule. There can only be dependencies from outer layer inward.

![Digram](https://user-images.githubusercontent.com/86293803/124607163-42040900-de76-11eb-8fc3-ca9a172a9fb5.png)

### Domain Layer
(Business logic) is the inner-most part of the onion (without dependencies to other layers, it is totally isolated). 
It contains:
- Use Cases
- Repositories Interfaces

### Data Repositories Layer 
contains Repository Implementations and one or many Data Sources. Data Source can be Remote or Local (for example persistent database or API). 
It contains:
- Repositories Implementations
- API (Network)
- Persistence DB

### Presentation Layer (MVVM)
Views are coordinated by ViewModels (Presenters) which execute one or many Use Cases. 
It contains:
- ViewModels
- Views

## Branching Strategy
We are following `git-flow` branching strategy.
- **main branch** - Stable release branch with tag
- **stage branch** - beta release branch for QA and testing.
- **dev branch** - a branch with new features
- **hotfix branch** - a bug fixes on release, it should branch out from `main` and merged into `main` then rebasing `stag` and `dev` branches
- **feature branch** - a branch where you develop a new feature, naming `feature/< FEATURE_NAME >`
- **enhancement branch** - a branch where you modify existing feature, naming `enhancement/< ENHANCEMENT_NAME >`