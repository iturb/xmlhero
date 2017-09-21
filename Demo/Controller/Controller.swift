import UIKit

class Controller:UIViewController
{
    private let kFileName:String = "demo"
    private let kExtension:String = "xml"
    
    override func loadView()
    {
        let view:View = View()
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Xml.object(
            fileName:kFileName,
            withExtension:kExtension,
            bundle:nil)
        { [weak self] (xml:Any?, error:XmlError?) in
            
            guard
            
                let xml:Any = xml
            
            else
            {
                if let errorDescription:String = error?.localizedDescription
                {
                    self?.updateContent(
                        content:errorDescription)
                }
                
                return
            }
            
            self?.updateContent(content:xml)
        }
    }
    
    //MARK: private
    
    private func updateContent(content:Any)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateContent(content:content)
        }
    }
    
    private func asyncUpdateContent(content:Any)
    {
        guard
            
            let view:View = self.view as? View,
            let customString:CustomStringConvertible = content as? CustomStringConvertible
            
        else
        {
            return
        }
        
        view.textView.text = customString.description
    }
}
