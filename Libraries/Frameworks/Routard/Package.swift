// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Routard",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Routard",
            targets: ["Routard"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Routard",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "DependenciesMacros", package: "swift-dependencies"),
            ]
        ),
        .testTarget(
            name: "RoutardTests",
            dependencies: ["Routard"]),
    ]
)
