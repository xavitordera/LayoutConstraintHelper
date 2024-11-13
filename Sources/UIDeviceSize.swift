import UIKit

// Enum for iPhone sizes specifically for iPhone SE to iPhone 15 models
public enum UIDeviceSize  {
    case iPhone3Point5Inch, iPhone4Inch, iPhone4Point7Inch, iPhone5Point5Inch, iPhone5Point8Inch
    case iPhone6Point1Inch, iPhone5Point4Inch, iPhone6Point5Inch, iPhone6Point7Inch, unknown
}

@MainActor public let deviceSize : UIDeviceSize = {
    let screenHeight: Double = max(Double(UIScreen.main.bounds.width), Double(UIScreen.main.bounds.height))
    let deviceType = UIDevice().type
    switch screenHeight {
    case 480:
        return .iPhone3Point5Inch
    case 568:
        return .iPhone4Inch
    case 667:
        return UIScreen.main.scale == 3.0 ? .iPhone5Point5Inch : .iPhone4Point7Inch
    case 736:
        return .iPhone5Point5Inch
    case 812:
        return deviceType == .iPhone12Mini ? .iPhone5Point4Inch : .iPhone5Point8Inch
    case 844:
        return .iPhone6Point1Inch
    case 896:
        return deviceType == .iPhoneXSMax ? .iPhone6Point5Inch : .iPhone6Point1Inch
    case 926:
        return .iPhone6Point7Inch
    default:
        return .unknown
    }
}()

// Enum for iPhone models from SE to iPhone 15
public enum Model : String {
    case simulator = "simulator/sandbox",
         iPhoneSE = "iPhone SE",
         iPhone7 = "iPhone 7",
         iPhone7Plus = "iPhone 7 Plus",
         iPhone8 = "iPhone 8",
         iPhone8Plus = "iPhone 8 Plus",
         iPhoneX = "iPhone X",
         iPhoneXS = "iPhone XS",
         iPhoneXSMax = "iPhone XS Max",
         iPhoneXR = "iPhone XR",
         iPhone11 = "iPhone 11",
         iPhone11Pro = "iPhone 11 Pro",
         iPhone11ProMax = "iPhone 11 Pro Max",
         iPhoneSE2 = "iPhone SE 2nd gen",
         iPhone12Mini = "iPhone 12 Mini",
         iPhone12 = "iPhone 12",
         iPhone12Pro = "iPhone 12 Pro",
         iPhone12ProMax = "iPhone 12 Pro Max",
         unrecognized = "?unrecognized?"
}

public extension UIDevice {
    var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) { ptr in
                String(utf8String: ptr)
            }
        }

        let modelMap: [String: Model] = [
            "i386": .simulator,
            "x86_64": .simulator,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,3": .iPhone7,
            "iPhone9,2": .iPhone7Plus,
            "iPhone9,4": .iPhone7Plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,4": .iPhone8,
            "iPhone10,2": .iPhone8Plus,
            "iPhone10,5": .iPhone8Plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXS,
            "iPhone11,4": .iPhoneXSMax,
            "iPhone11,6": .iPhoneXSMax,
            "iPhone11,8": .iPhoneXR,
            "iPhone12,1": .iPhone11,
            "iPhone12,3": .iPhone11Pro,
            "iPhone12,5": .iPhone11ProMax,
            "iPhone12,8": .iPhoneSE2,
            "iPhone13,1": .iPhone12Mini,
            "iPhone13,2": .iPhone12,
            "iPhone13,3": .iPhone12Pro,
            "iPhone13,4": .iPhone12ProMax,
        ]

        if let modelCode, let model = modelMap[modelCode] {
            if model == .simulator, let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                if let simModel = modelMap[simModelCode] {
                    return simModel
                }
            }
            return model
        }

        return Model.unrecognized
    }
}
