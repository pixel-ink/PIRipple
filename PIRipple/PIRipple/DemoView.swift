
import UIKit

class DemoView1 : UIView {
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            let location = t.location(in: self)
            
            //RIPPLE BORDER
            rippleBorder(location: location, color: .white)
            
        }
    }
}

class DemoView2 : UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        for touch: AnyObject in touches {
            let t: UITouch = touch as! UITouch
            let location = t.location(in: self)
            
            //RIPPLE FILL
            rippleFill(location: location, color: .white)
            
        }
    }  
}
