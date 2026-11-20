// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationFacebook",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationFacebook", targets: ["Yodo1MasMediationFacebookTarget"]),
        .library(name: "Yodo1MasMediationFacebook-AppLovinMediationFacebookAdapter", targets: ["Yodo1MasMediationFacebook-AppLovinMediationFacebookAdapterTarget"]),
        .library(name: "Yodo1MasMediationFacebook-MetaAdapter", targets: ["Yodo1MasMediationFacebook-MetaAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/facebook/FBAudienceNetwork.git", exact: "6.22.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationFacebook ====================
        .target(
            name: "Yodo1MasMediationFacebookTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFacebook"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork"),
            ],
            path: "Sources/Yodo1MasMediationFacebookTarget",
            resources: [.copy("Yodo1MasFacebook.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationFacebook",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFacebook/Yodo1MasMediationFacebook-5.0.0-beta.5.zip",
            checksum: "713b4d9fc8ab4d329de0a5afc851964ee5014966b1fdae777d7e5046883e4808"
        ),
        // ==================== Yodo1MasMediationFacebook-AppLovinMediationFacebookAdapter ====================
        .target(
            name: "Yodo1MasMediationFacebook-AppLovinMediationFacebookAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFacebookTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationFacebookAdapter"),
            ],
            path: "Sources/Yodo1MasMediationFacebook-AppLovinMediationFacebookAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationFacebookAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFacebook/AppLovinMediationFacebookAdapter-5.0.0-beta.5.zip",
            checksum: "ef2b4d78c95b1485603f426aa5482ad49f473b840e3e616a8c060c757bb0b762"
        ),
        // ==================== Yodo1MasMediationFacebook-MetaAdapter ====================
        .target(
            name: "Yodo1MasMediationFacebook-MetaAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFacebookTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "MetaAdapter"),
            ],
            path: "Sources/Yodo1MasMediationFacebook-MetaAdapterTarget"
        ),
        .binaryTarget(
            name: "MetaAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFacebook/MetaAdapter-5.0.0-beta.5.zip",
            checksum: "cf26dee84ee45bef6aae7bfcf3367fc5c0e78eb74f038b18d739427387536b9d"
        ),
    ]
)
