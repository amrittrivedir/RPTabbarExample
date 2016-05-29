

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    
    var destinationViewController:UIViewController!
    var oldViewController:UIViewController!
    var _viewControllersByIdentifier:NSMutableDictionary!
    var destinationIdentifier:NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _viewControllersByIdentifier = NSMutableDictionary()
        
        if(self.childViewControllers.count < 1){
            self.performSegueWithIdentifier("FirstSegue", sender: nil)
        }
        
        
    }
    
    @IBAction func btnFirstTabClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("FirstSegue", sender: nil)
    }
    
    
    @IBAction func btnSecondTabClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("SecondSegue", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.oldViewController = self.destinationViewController;
        
        
        if((_viewControllersByIdentifier.objectForKey(segue.identifier!)) == nil){
            _viewControllersByIdentifier.setObject(segue.destinationViewController, forKey: segue.identifier!)
        }
        
        
        
        self.destinationIdentifier = segue.identifier;
        self.destinationViewController = _viewControllersByIdentifier.objectForKey(self.destinationIdentifier) as! UIViewController;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

