
![PIRipple](https://raw.github.com/wiki/pixel-ink/PIRipple/pir.png)

## Ripple Effect for iOS (swift)

![](https://cocoapod-badges.herokuapp.com/l/PIRipple/badge.png)
![](https://cocoapod-badges.herokuapp.com/v/PIRipple/badge.png)
![](https://cocoapod-badges.herokuapp.com/p/PIRipple/badge.png)
![](https://img.shields.io/badge/twitter-@pixelink__jp-blue.svg)

---

#demo

![demo](https://raw.github.com/wiki/pixel-ink/PIRipple/demo.gif)

- if try this demo. git clone / download and open project, and run.

---

# install

- manually
  - add PIRipple.swift into your project
- cocoapods
  - add " pod 'PIRipple', '1.0.0' " into your Podfile
  - add " import PIRipple " into your code

# basic usage

### uiview extention


```
UIView.rippleBorder(CGPoint, color: UIColor)
```

```
UIView.rippleFill(CGPoint, color: UIColor)
```

"CGPoint" means location in view

- example

```
override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
  super.touchesBegan(touches, withEvent: event)
  for touch: AnyObject in touches {
    var t: UITouch = touch as! UITouch
    let location = t.locationInView(self)

    rippleBorder(location, color: UIColor.whiteColor())

  }
}
```

- run your code after animation

```
rippleBorder(location, color: UIColor.whiteColor()) {
  println("animation completed")
  // your code
}
```


### class method

```
Ripple.border(view:UIView, locationInView or absolutePosition:CGPoint, color:UIColor)

```

```
Ripple.fill(view:UIView, locationInView or absolutePosition:CGPoint, color:UIColor)
```

- locationInView
	- CGPointZero is top & left in UIView.

- absolutePosition
	- CGPointZero is top & left in UIWindow.



- example

```
Ripple.border(self.view, locationInView:CGPointZero, color:UIColor.whiteColor())

```


- run your code after animation

```
Ripple.border(tagetView, locationInView:CGPointZero, color: UIColor.whiteColor()) {
  println("animation completed")
  // your code
}
```

# advanced usage

- example

```
var option = Ripple.option()
//configure
option.borderWidth = CGFloat(5.0)
option.radius = CGFloat(30.0)
option.duration = CFTimeInterval(0.4)
option.borderColor = UIColor.whiteColor()
option.fillColor = UIColor.clearColor()
option.scale = CGFloat(3.0)

Ripple.run(self, locationInView: CGPointZero, option: option){
  println("animation completed")
}

```

