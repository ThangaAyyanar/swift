
# Sample Project in SPM

* Create a Folder and go inside it
* Create a empty project using the command
```
swift package init --type library
```
* Dependency can be found using
```
https://swiftpackageindex.com
```
* Add dependency to the project
```swift
import PackageDescription

let package = Package(
    name: "<YourPackageName>",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "<YourPackageName>",
            targets: ["<YourPackageName>"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ashleymills/Reachability.swift.git", from: "5.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "<YourPackageName>",
            dependencies: []),
        .testTarget(
            name: "DependencyTests",
                    dependencies: [
                        /*.product(name: "Reachability", package: "Reachability"),*/
                      ]),

            dependencies: ["<YourPackageName>"]),
    ]
)
```
* build the project locally using
```
swift build
```

# Reference
- https://www.raywenderlich.com/7242045-swift-package-manager-for-ios
- https://developer.apple.com/documentation/swift_packages
- https://medium.com/better-programming/how-to-add-compiled-frameworks-in-swift-package-manager-f0cdbde84fc7
- https://medium.com/swlh/using-local-swift-packages-in-xcode-without-making-them-git-repos-3aa046cc222c
- https://github.com/renaudjenny/Swift-Package-Manager-Static-Dynamic-Xcode-Bug
