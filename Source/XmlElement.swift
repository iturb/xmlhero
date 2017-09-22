import Foundation

final class XmlElement
{
    let name:String
    private(set) weak var parent:XmlElement?
    private(set) var attributes:[String:String]?
    private(set) var children:[XmlElement]?
    private(set) var value:String?
    
    init(
        name:String,
        parent:XmlElement?)
    {
        self.name = name
        self.parent = parent
    }
    
    //MARK: internal
    
    func append(string:String)
    {
        if value == nil
        {
            value = String()
        }
        
        value?.append(string)
    }
    
    func addAttribute(name:String, value:String)
    {
        if attributes == nil
        {
            attributes = [:]
        }
        
        attributes?[name] = value
    }
    
    func addChild(child:XmlElement)
    {
        if children == nil
        {
            children = []
        }
        
        children?.append(child)
    }
}
