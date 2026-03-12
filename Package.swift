// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "LSDialogViewController",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "LSDialogViewController",
            targets: ["LSDialogViewController"]
        ),
    ],
    targets: [
        .target(
            name: "LSDialogViewController",
            path: "LSDialogViewController/Classes"
        ),
    ]
)
