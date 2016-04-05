
import UIKit

class DemoView1 : UIView {
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)
    for touch: AnyObject in touches {
      let t: UITouch = touch as! UITouch
      let location = t.locationInView(self)
      
      //RIPPLE BORDER
      rippleBorder(location, color: UIColor.whiteColor())

    }
  }

}

class DemoView2 : UIView {
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    super.touchesBegan(touches, withEvent: event)
    for touch: AnyObject in touches {
      let t: UITouch = touch as! UITouch
      let location = t.locationInView(self)

      //RIPPLE FILL
      rippleFill(location, color: UIColor.whiteColor())

    }
  }
  
}