import PackageDescription

let package = Package(
    name: "Clock",
    dependencies: [
    .Package(url: "https://github.com/neonichu/spectre-build.git", majorVersion: 0),
    ]
)
