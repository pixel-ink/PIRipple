import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var demoView1: RippleView!
  @IBOutlet weak var demoView2: RippleView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //programatically
    demoView1.enableRipple = true
    demoView1.rippleType = 1 // 1 for fill and 2 for border

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

