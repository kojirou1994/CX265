// swift-tools-version:5.0

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
      providers: [.brew(["x265"])]
    )
  ]
)
