// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "CoherentSwift",
	platforms: [
		.macOS(.v10_15)
	],
    products: [
        .executable(name: "coherent-swift", targets: ["CoherentSwift"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/jakeheis/SwiftCLI",
            from: "6.0.2"
        ),
        .package(
            url: "https://github.com/kylef/PathKit",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/jpsim/Yams.git",
            from: "4.0.1"
        ),
        .package(
			name: "SwiftSyntax",
            url: "https://github.com/apple/swift-syntax.git",
            .exact("0.50300.0")
        )
    ],
    targets: [
        .target(
            name: "CoherentSwiftCore",
            dependencies: [
                "SwiftCLI",
                "PathKit",
                "Yams",
                "SwiftSyntax"
            ]
        ),
        .target(
            name: "CoherentSwift",
            dependencies: [
                "CoherentSwiftCore"
            ]
        ),
        .testTarget(
            name: "CLITests",
            dependencies: ["CoherentSwift"]
        ),
    ]
)
