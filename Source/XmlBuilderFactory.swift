import Foundation

extension XmlBuilder
{
    private static let kDeclaration:String = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
    private static let kAttribute:String = " %@=\"%@\""
    
    //MARK: internal
    
    class func factoryHeader() -> String
    {
        return kDeclaration
    }
    
    class func mergeAttributes(
        name:String,
        attributes:[String:String]?) -> String
    {
        guard
        
            let attributes:[String:String] = attributes
        
        else
        {
            return name
        }
        
        var string:String = String()
        string.append(name)
        let keys:[String] = Array(attributes.keys)
        
        for key:String in keys
        {
            guard
            
                let value:String = attributes[key]
            
            else
            {
                continue
            }
            
            let attribute:String = String(
                format:kAttribute,
                key,
                value)
            
            string.append(attribute)
        }
        
        return string
    }
    
    class func factoryChildren(
        dictionary:[String:Any]) -> [String:Any]
    {
        var children:[String:Any] = [:]
        let keys:[String] = Array(dictionary.keys)
        
        for key:String in keys
        {
            guard
            
                key != Xml.kTextKey,
                let object:Any = dictionary[key]
            
            else
            {
                continue
            }
            
            let string:String? = anyToString(
                value:object)
            
            guard
                
                string == nil
                
            else
            {
                continue
            }
            
            children[key] = object
        }
        
        return children
    }
    
    class func factoryAttributes(
        dictionary:[String:Any]) -> [String:String]
    {
        var attributes:[String:String] = [:]
        let keys:[String] = Array(dictionary.keys)
        
        for key:String in keys
        {
            guard
                
                key != Xml.kTextKey,
                let object:Any = dictionary[key],
                let string:String = anyToString(
                    value:object)
                
            else
            {
                continue
            }
            
            attributes[key] = string
        }
        
        return attributes
    }
}
