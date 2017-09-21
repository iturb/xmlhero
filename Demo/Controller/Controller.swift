import UIKit

class Controller:UIViewController
{
    override func loadView()
    {
        let view:View = View()
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard
        
            let view:View = self.view as? View
        
        else
        {
            return
        }
        
        view.textView.text = "hello world"
    }
}
