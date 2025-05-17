// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "AppFeature",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
    ],
    dependencies: [
        .package(name: "DetailsFeature", path: "../../Features/DetailsFeature"),
        .package(name: "HomeFeature", path: "../../Features/HomeFeature"),
        .package(name: "SettingsFeature", path: "../../Features/SettingsFeature"),
        .package(name: "SplashScreenFeature", path: "../../Features/SplashScreenFeature"),
        .package(name: "TabFeature", path: "../../Features/TabFeature"),

        .package(name: "Routard", path: "../../Frameworks/Routard"),

        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "DetailsFeature",
                "HomeFeature",
                "SettingsFeature",
                "SplashScreenFeature",
                "TabFeature",

                "Routard",

                .product(name: "Dependencies", package: "swift-dependencies"),
            ]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: ["AppFeature"]),
    ]
)
