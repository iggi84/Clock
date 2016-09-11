import PackageDescription

let package = Package(
    name: "Clock",
    dependencies: [
        .Package(url: "https://github.com/iggi84/spectre-build.git", majorVersion: 0),
        ]
)
