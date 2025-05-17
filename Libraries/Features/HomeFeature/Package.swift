// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"])
    ],
    dependencies: [
        .package(name: "Routard", path: "../../Frameworks/Routard"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "HomeFeature",
            dependencies: [
                "Routard",
                .product(name: "Dependencies", package: "swift-dependencies"),
            ]
        ),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"]),
    ]
)
