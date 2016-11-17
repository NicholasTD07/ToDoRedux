import PackageDescription

let package = Package(
    name: "ToDoRedux",
    targets: [
        Target(name: "ToDoRedux"),
        Target(name: "App", dependencies: [
            "ToDoRedux",
        ]),
        Target(name: "ToDoReduxTests"),
        Target(name: "AppTests", dependencies: [
            "App",
        ]),
    ],
    dependencies: [
        .Package(url: "https://github.com/NicholasTD07/TDRedux.swift.git",
                 majorVersion: 2),
    ]
)
