// swift-tools-version: 5.8

import PackageDescription

extension Target.Dependency {
  static let gbeatKit: Self = .init(stringLiteral: "GBeatKit")
  static let gbeatServer: Self = .init(stringLiteral: "GBeatServer")
  static let gbeatUI: Self = .init(stringLiteral: "GBeatUI")
  static let gbserver: Self = .init(stringLiteral: "gbserver")

  enum Apple {
    static func logging(_ condition: TargetDependencyCondition? = nil) -> Target.Dependency {
      .product(name: "Logging", package: "swift-log", condition: condition)
    }
  }

  enum BrightDigit {
    static let prch: Target.Dependency = .product(name: "Prch", package: "Prch")
    static let prchModel: Target.Dependency = .product(name: "PrchModel", package: "Prch")
    static let felinePine: Target.Dependency = .product(name: "FelinePine", package: "FelinePine")
    static let fitnessStream: Target.Dependency = .product(name: "FitnessStream", package: "FitnessStream")
    static let fitnessStreamUI: Target.Dependency = .product(name: "FitnessStreamUI", package: "FitnessStream")
    static let sundial: Target.Dependency = .product(name: "SundialKit", package: "SundialKit")
    static let routeGroups: Target.Dependency = .product(name: "RouteGroups", package: "RouteGroups")
  }

  enum Others {
    static let queuesFluentDriver: Target.Dependency = .product(name: "QueuesFluentDriver", package: "vapor-queues-fluent-driver")
    static let vaporOpenAPI: Target.Dependency = .product(name: "VaporOpenAPI", package: "VaporOpenAPI")
    static let yams: Target.Dependency = .product(name: "Yams", package: "Yams")
  }

  enum Vapor {
    static let apns: Target.Dependency = .product(name: "APNS", package: "apns")
    static let fluent: Target.Dependency = .product(name: "Fluent", package: "fluent")
    static let fluentPostgresDriver: Target.Dependency = .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver")
    static let jwt: Target.Dependency = .product(name: "JWT", package: "jwt")
    static let redis: Target.Dependency = .product(name: "Redis", package: "redis")
    static let vapor: Target.Dependency = .product(name: "Vapor", package: "vapor")
  }
}

extension Package.Dependency {
  enum Apple {
    static let log: Package.Dependency = .package(url: "https://github.com/apple/swift-log.git", from: "1.4.0")
  }

  enum BrightDigit {
    static let prch: Package.Dependency = .package(path: "Packages/Prch")
    static let fitnessStream: Package.Dependency = .package(path: "Packages/FitnessStream")
    static let routeGroups: Package.Dependency = .package(url: "https://github.com/brightdigit/RouteGroups", from: "0.1.0-alpha.3")
    static let felinePine: Package.Dependency = .package(url: "https://github.com/brightdigit/FelinePine", from: "0.1.0-alpha.3")
    static let sundialKit: Package.Dependency = .package(url: "https://github.com/brightdigit/SundialKit.git", from: "0.2.1")
  }

  enum Others {
    static let apnsSwift: Package.Dependency = .package(url: "https://github.com/swift-server-community/APNSwift.git", exact: "5.0.0-beta.2")
    static let vaporOpenAPI: Package.Dependency = .package(url: "https://github.com/mattpolzin/VaporOpenAPI.git", from: "0.3.0")
    static let vaporQueuesFluentDriver: Package.Dependency = .package(url: "https://github.com/m-barthelemy/vapor-queues-fluent-driver.git", from: "1.0.0")
    static let yams: Package.Dependency = .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0")
  }

  enum Vapor {
    static let apns: Package.Dependency = .package(url: "https://github.com/vapor/apns.git", exact: "4.0.0-beta.2")
    static let fluent: Package.Dependency = .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0")
    static let fluentPostgresDriver: Package.Dependency = .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0")
    static let jwt: Package.Dependency = .package(url: "https://github.com/vapor/jwt.git", from: "4.0.0")
    static let redis: Package.Dependency = .package(url: "https://github.com/vapor/redis.git", revision: "e4b31372f4684ac96cefe991a53bba2da91d26ab")
    static let vapor: Package.Dependency = .package(url: "https://github.com/vapor/vapor.git", from: "4.50.0")
  }
}

let package = Package(
  name: "GBeatKit",
  defaultLocalization: "en",
  platforms: [.iOS(.v14), .macOS(.v13), .watchOS(.v7)],
  products: [
    .library(name: "GBeatKit", targets: ["GBeatKit"]),
    .library(name: "GBeatServer", targets: ["GBeatServer"]),
    .library(name: "GBeatUI", targets: ["GBeatUI"]),
    .executable(name: "gbserver", targets: ["gbserver"]),
    .executable(name: "fodworkout", targets: ["fodworkout"])
  ],
  dependencies: [
    .Apple.log,
    .BrightDigit.prch,
    .BrightDigit.felinePine,
    .BrightDigit.fitnessStream,
    .BrightDigit.sundialKit,
    .BrightDigit.routeGroups,
    .Others.vaporOpenAPI,
    .Others.vaporQueuesFluentDriver,
    .Others.yams,
    .Vapor.apns,
    .Vapor.fluent,
    .Vapor.fluentPostgresDriver,
    .Vapor.jwt,
    .Vapor.redis,
    .Vapor.vapor,

    // [@bsrz] May 28, 2023
    // This dependency is only here to force the `5.0.0-beta.2` version.
    // Vapor's APNS beta2 uses this dependency as `from` and because of other beta version with breaking changes, it prevents all things from building.
    // We can remove this line once we've moved onto 4.0.0-beta.3 or above of Vapor's APNS package.
    .Others.apnsSwift
  ],
  targets: [
    .executableTarget(
      name: "gbserver",
      dependencies: [
        .gbeatServer,
        .Apple.logging()
      ]
    ),

    .executableTarget(name: "fodworkout",
                      dependencies: [.gbeatKit,
                                     .BrightDigit.prch]),

    .target(
      name: "GBeatKit",
      dependencies: [
        .BrightDigit.prch,
        .BrightDigit.felinePine,
        .BrightDigit.fitnessStream,
        .BrightDigit.prchModel
      ]
    ),

    .target(
      name: "GBeatUI",
      dependencies: [
        .Apple.logging(.when(platforms: [.linux])),
        .BrightDigit.prch,
        .BrightDigit.felinePine,
        // .BrightDigit.fitnessStreamReporter,
        .BrightDigit.fitnessStreamUI,
        // .BrightDigit.sublimation,
        .BrightDigit.sundial,
        .gbeatKit
      ]
    ),

    .target(
      name: "GBeatServer",
      dependencies: [
        // .BrightDigit.base32,
        .BrightDigit.fitnessStream,
        // .BrightDigit.fitnessStreamReporter,
        .BrightDigit.routeGroups,
//        .BrightDigit.simulatorServices,
//        .BrightDigit.spinetail,
//        .BrightDigit.spinetailVapor,
//        .BrightDigit.sublimationVapor,
        .Others.queuesFluentDriver,
        .Others.vaporOpenAPI,
        .Others.yams,
        .Vapor.apns,
        .Vapor.fluent,
        .Vapor.fluentPostgresDriver,
        .Vapor.jwt,
        // .Vapor.mailgun,
        .Vapor.redis,
        .Vapor.vapor,
        .gbeatKit
      ]
    )
  ]
)
