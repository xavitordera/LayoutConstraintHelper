
# LayoutConstraintHelper

**LayoutConstraintHelper** is a powerful utility to help developers manage and adjust layout constraints dynamically for various iPhone screen sizes, with a focus on compatibility from iPhone SE to iPhone 16 models. 

## Overview

This helper class provides an interface for setting layout constants based on device size, ensuring a responsive layout across different screen dimensions without needing separate logic for each device.

### Enum for Device Sizes

The library now uses updated enum case names for device sizes, ensuring better Swift naming conventions without underscores. Device sizes such as `iPhone4Inch`, `iPhone6Point1Inch`, etc., are supported for clarity and Swift consistency.

## Installation

### Swift Package Manager

`LayoutConstraintHelper` is available exclusively through **Swift Package Manager (SPM)**.

To install it via SPM:
1. Open your project in Xcode.
2. Go to **File > Swift Packages > Add Package Dependency**.
3. Enter the repository URL: [https://github.com/xavitordera/LayoutConstraintHelper](https://github.com/xavitordera/LayoutConstraintHelper)
4. Select the desired version and add the package to your project.

## Usage

After importing `LayoutConstraintHelper` into your project, you can adjust constraints directly in Interface Builder using the `@IBInspectable` properties for each supported iPhone model. Here’s an example setup:

```swift
@IBInspectable var iPhoneSE: CGFloat = 0.0 {
    didSet { deviceConstant(.iPhone4Inch, value: iPhoneSE) }
}
@IBInspectable var iPhone16ProMax: CGFloat = 0.0 {
    didSet { deviceConstant(.iPhone6Point7Inch, value: iPhone16ProMax) }
}
```

### Supported iPhone Sizes
`LayoutConstraintHelper` currently supports:
- iPhone SE to iPhone 16 models, including Pro and Pro Max versions.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/xavitordera/LayoutConstraintHelper/blob/main/LICENSE) file for details.
