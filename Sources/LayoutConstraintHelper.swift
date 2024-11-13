import UIKit

@IBDesignable
public class NSLayoutConstraintHelper: NSLayoutConstraint {
    @IBInspectable var iPhoneSE: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone4Inch, value: iPhoneSE) }
    }
    @IBInspectable var iPhoneSE2G: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone4Point7Inch, value: iPhoneSE2G) }
    }
    @IBInspectable var iPhone8Plus: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone5Point5Inch, value: iPhone8Plus) }
    }
    @IBInspectable var iPhone11Pro: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone5Point8Inch, value: iPhone11Pro) }
    }
    @IBInspectable var iPhone12Mini: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone5Point4Inch, value: iPhone12Mini) }
    }
    @IBInspectable var iPhone11: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point1Inch, value: iPhone11) }
    }
    @IBInspectable var iPhone12: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point1Inch, value: iPhone12) }
    }
    @IBInspectable var iPhone12ProMax: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point7Inch, value: iPhone12ProMax) }
    }
    @IBInspectable var iPhone14: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point1Inch, value: iPhone14) }
    }
    @IBInspectable var iPhone14ProMax: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point7Inch, value: iPhone14ProMax) }
    }
    @IBInspectable var iPhone15: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point1Inch, value: iPhone15) }
    }
    @IBInspectable var iPhone15ProMax: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point7Inch, value: iPhone15ProMax) }
    }
    @IBInspectable var iPhone16: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point1Inch, value: iPhone16) }
    }
    @IBInspectable var iPhone16ProMax: CGFloat = 0.0 {
        didSet { deviceConstant(.iPhone6Point7Inch, value: iPhone16ProMax) }
    }

    // Helper to set the constant based on the device size
    open func deviceConstant(_ device: UIDeviceSize, value: CGFloat) {
        if deviceSize == device {
            constant = value
        }
    }
}
