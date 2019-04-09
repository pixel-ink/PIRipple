
import UIKit

enum RippleType: Int {
    case fill = 1
    case border = 2
}

@IBDesignable
class RippleView : UIView {
    
    @IBInspectable
    var enableRipple: Bool = false
   
    ///Default 1, 1 is for fill and 2 is for border
    @IBInspectable
    var rippleType: Int = 1
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            let location = t.location(in: self)
            
            guard enableRipple else {return}
            guard let rippleType = RippleType(rawValue: rippleType) else {return}
            
            switch rippleType {
            case .fill:
                rippleFill(location, color: UIColor.white)
                
                break
            case .border:
                rippleBorder(location: location, color: UIColor.white)
                break
            }
        }
    }
}
