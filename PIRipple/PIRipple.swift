//---------------------------------------
// https://github.com/pixel-ink/PIRipple
//---------------------------------------

import UIKit

public extension UIView {

  public func rippleBorder(location:CGPoint, color:UIColor) {
    rippleBorder(location, color: color){}
  }

  public func rippleBorder(location:CGPoint, color:UIColor, then: ()->() ) {
    Ripple.border(self, locationInView: location, color: color, then: then)
  }

  public func rippleFill(location:CGPoint, color:UIColor) {
    rippleFill(location, color: color){}
  }
  
  public func rippleFill(location:CGPoint, color:UIColor, then: ()->() ) {
    Ripple.fill(self, locationInView: location, color: color, then: then)
  }

}

public class Ripple {
  
  public struct Option {
    public var borderWidth = CGFloat(5.0)
    public var radius = CGFloat(30.0)
    public var duration = CFTimeInterval(0.4)
    public var borderColor = UIColor.whiteColor()
    public var fillColor = UIColor.clearColor()
    public var scale = CGFloat(3.0)
  }

  public class func option () -> Option {
    return Option()
  }
  
  public class func run(view:UIView, locationInView:CGPoint, option:Ripple.Option) {
    run(view, locationInView: locationInView, option: option){}
  }

  public class func run(view:UIView, locationInView:CGPoint, option:Ripple.Option, then: ()->() ) {
    prePreform(view, point: locationInView, option: option, isLocationInView: true, isRunSuperView: true, then: then)
  }

  public class func run(view:UIView, absolutePosition:CGPoint, option:Ripple.Option) {
    run(view, absolutePosition: absolutePosition, option: option){}
  }

  public class func run(view:UIView, absolutePosition:CGPoint, option:Ripple.Option, then: ()->() ) {
    prePreform(view, point: absolutePosition, option: option, isLocationInView: false, isRunSuperView: true, then: then)
  }

  public class func border(view:UIView, locationInView:CGPoint, color:UIColor) {
    border(view, locationInView: locationInView, color: color){}
  }
  
  public class func border(view:UIView, locationInView:CGPoint, color:UIColor, then: ()->() ) {
    var opt = Ripple.Option()
    opt.borderColor = color
    prePreform(view, point: locationInView, option: opt, isLocationInView: true, isRunSuperView: true, then: then)
  }

  public class func border(view:UIView, absolutePosition:CGPoint, color:UIColor) {
    border(view, absolutePosition: absolutePosition, color: color){}
  }

  public class func border(view:UIView, absolutePosition:CGPoint, color:UIColor, then: ()->() ) {
    var opt = Ripple.Option()
    opt.borderColor = color
    prePreform(view, point: absolutePosition, option: opt, isLocationInView: false, isRunSuperView: true, then: then)
  }
  
  public class func fill(view:UIView, locationInView:CGPoint, color:UIColor) {
    fill(view, locationInView: locationInView, color: color){}
  }

  public class func fill(view:UIView, locationInView:CGPoint, color:UIColor, then: ()->() ) {
    var opt = Ripple.Option()
    opt.borderColor = color
    opt.fillColor = color
    prePreform(view, point: locationInView, option: opt, isLocationInView: true, isRunSuperView: true, then: then)
  }
 
  public class func fill(view:UIView, absolutePosition:CGPoint, color:UIColor) {
    fill(view, absolutePosition: absolutePosition, color: color){}
  }
  
  public class func fill(view:UIView, absolutePosition:CGPoint, color:UIColor, then: ()->() ) {
    var opt = Ripple.Option()
    opt.borderColor = color
    opt.fillColor = color
    prePreform(view, point: absolutePosition, option: opt, isLocationInView: false, isRunSuperView: true, then: then)
  }
  
  private class func prePreform(view:UIView, point:CGPoint, option: Ripple.Option, isLocationInView:Bool, isRunSuperView: Bool, then: ()->() ) {
    
    let p = isLocationInView ? CGPointMake(point.x + view.frame.origin.x, point.y + view.frame.origin.y) : point
    if isRunSuperView, let superview = view.superview {
      prePreform(
        superview,
        point: p,
        option: option,
        isLocationInView: isLocationInView,
        isRunSuperView: isRunSuperView,
        then: then
      )
    } else {
      perform(
        view,
        point:p,
        option:option,
        then: then
        )
    }
  }
  
  private class func perform(view:UIView, point:CGPoint, option: Ripple.Option, then: ()->() ) {
    UIGraphicsBeginImageContextWithOptions (
      CGSizeMake((option.radius + option.borderWidth) * 2, (option.radius + option.borderWidth) * 2), false, 3.0)
    let path = UIBezierPath(
      roundedRect: CGRectMake(option.borderWidth, option.borderWidth, option.radius * 2, option.radius * 2),
      cornerRadius: option.radius)
    option.fillColor.setFill()
    path.fill()
    option.borderColor.setStroke()
    path.lineWidth = option.borderWidth
    path.stroke()
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    let opacity = CABasicAnimation(keyPath: "opacity")
    opacity.autoreverses = false
    opacity.fillMode = kCAFillModeForwards
    opacity.removedOnCompletion = false
    opacity.duration = option.duration
    opacity.fromValue = 1.0
    opacity.toValue = 0.0
    
    let transform = CABasicAnimation(keyPath: "transform")
    transform.autoreverses = false
    transform.fillMode = kCAFillModeForwards
    transform.removedOnCompletion = false
    transform.duration = option.duration
    transform.fromValue = NSValue(CATransform3D: CATransform3DMakeScale(1.0 / option.scale, 1.0 / option.scale, 1.0))
    transform.toValue = NSValue(CATransform3D: CATransform3DMakeScale(option.scale, option.scale, 1.0))
    
    dispatch_async(dispatch_get_main_queue()) {
      let layer = CALayer()
      layer.contents = img.CGImage
      layer.frame = CGRectMake(point.x - option.radius, point.y - option.radius, option.radius * 2, option.radius * 2)
      view.layer.addSublayer(layer)
      CATransaction.begin()
      CATransaction.setAnimationDuration(option.duration)
      CATransaction.setCompletionBlock {
        layer.contents = nil
        layer.removeAllAnimations()
        layer.removeFromSuperlayer()
        then()
      }
      layer.addAnimation(opacity, forKey:nil)
      layer.addAnimation(transform, forKey:nil)
      CATransaction.commit()
    }
  }
}