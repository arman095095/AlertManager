// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/huri000/SwiftEntryKit.git", from: "2.0.0"),
    .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
]

let package = Package(
    name: "AlertManager",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AlertManager",
            targets: ["AlertManager"]),
    ],
    dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AlertManager",
            dependencies: [.product(name: "SwiftEntryKit", package: "SwiftEntryKit"),
                           .product(name: "Swinject", package: "Swinject")]),
    ]
)
