import PackageDescription

let package = Package(
    name: "ToDoRedux",
    dependencies: [
        .Package(url: "https://github.com/NicholasTD07/TDRedux.swift.git",
                 majorVersion: 2),
    ]
)
