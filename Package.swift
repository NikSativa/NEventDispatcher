// swift-tools-version:5.9
// swiftformat:disable all
import PackageDescription

let package = Package(
    name: "NEventDispatcher",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .macCatalyst(.v13),
        .visionOS(.v1),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "NEventDispatcher", targets: ["NEventDispatcher"]),
        .library(name: "NEventDispatcherTestHelpers", targets: ["NEventDispatcherTestHelpers"])
    ],
    dependencies: [
        .package(url: "https://github.com/NikSativa/NQueue.git", .upToNextMajor(from: "1.2.4")),
        .package(url: "https://github.com/NikSativa/NSpry.git", .upToNextMajor(from: "2.1.4"))
    ],
    targets: [
        .target(name: "NEventDispatcher",
                dependencies: [
                    "NQueue"
                ],
                path: "Sources",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .target(name: "NEventDispatcherTestHelpers",
                dependencies: [
                    "NEventDispatcher",
                    "NSpry"
                ],
                path: "TestHelpers",
                resources: [
                    .copy("../PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "NEventDispatcherTests",
                    dependencies: [
                        "NQueue",
                        .product(name: "NQueueTestHelpers", package: "NQueue"),
                        "NSpry",
                        "NEventDispatcher",
                        "NEventDispatcherTestHelpers"
                    ],
                    path: "Tests")
    ]
)
