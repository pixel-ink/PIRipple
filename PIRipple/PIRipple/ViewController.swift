import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var demoView1: DemoView1!
  @IBOutlet weak var demoView2: DemoView2!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    demoView1.layer.borderColor = UIColor.white.cgColor
    demoView2.layer.borderColor = UIColor.white.cgColor
    demoView1.layer.borderWidth = 1.0
    demoView2.layer.borderWidth = 1.0
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

