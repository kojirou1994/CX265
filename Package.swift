// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "CX265",
  products: [
    .library(name: "CX265", targets: ["CX265"]),
  ],
  targets: [
    .systemLibrary(
      name: "CX265",
      pkgConfig: "x265",
      providers: [
        .brew(["x265"]),
        .apt(["libx265-dev"]),
      ]
    ),
    .testTarget(
      name: "CX265Tests",
      dependencies: ["CX265"]
    )
  ]
)
