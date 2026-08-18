// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MusicMix",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "MusicMixCore",
            targets: ["MusicMixCore"]
        )
    ],
    targets: [
        .target(
            name: "MusicMixCore"
        ),
        .testTarget(
            name: "MusicMixCoreTests",
            dependencies: ["MusicMixCore"]
        )
    ]
)
