// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Recipe",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Recipe",
            targets: ["Recipe"]),
    ],
    dependencies: [
            // Add the local package by specifying its path
            .package(name: "Common", path: "Packages/Common"),
            .package(name: "NetworkService", path: "Packages/NetworkService"),
            .package(name: "DataModels", path: "Packages/DataModels")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Recipe",
            dependencies: [
                "Common",
                "NetworkService",
                "DataModels"
            ]
        ),
        .testTarget(
            name: "RecipeTests",
            dependencies: ["Recipe"]
        ),
    ]
)
