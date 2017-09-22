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
        parent:XmlElement?,
        attributes:[String:String])
    {
        self.name = name
        self.parent = parent
        
        if attributes.count > 0
        {
            self.attributes = attributes
        }
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
    
    func addChild(child:XmlElement)
    {
        if children == nil
        {
            children = []
        }
        
        children?.append(child)
    }
}
