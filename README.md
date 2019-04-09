
# PIRipple

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
  - add " pod 'PIRipple', '1.1.0' " into your Podfile
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

"CGPoint" means location in view

- example
  - Subclass RippleView for UIView 
  - enableRipple porperty 
  - set rippleType property

1. with Storyboard
  - Add View on storyboard RippleView
  - Set class type to 
  
 (https://github.com/dipkasyap/PIRipple/blob/master/Screen%20Shot%202019-04-09%20at%2010.22.48%20am.png)
  
  - Set property on Attributes inspector 
  
 (https://github.com/dipkasyap/PIRipple/blob/master/Screen%20Shot%202019-04-09%20at%2010.22.48%20am.png)

```
 @IBOutlet weak var demoView1: RippleView!
```
2. programatically
```

    yourView.enableRipple = true
    yourView.rippleType = 1 // 1 for fill and 2 for border 
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

- your config animation

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

- cancel animation

```
UIView.rippleStop()
Ripple.stop(self.view)
```
