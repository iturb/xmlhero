import Foundation

extension XmlBuilder
{
    //MARK: internal
    
    func deserialize(
        dictionary:[String:Any]) -> String
    {
        var string:String = String()
        let keys:[String] = Array(dictionary.keys)
        
        for key:String in keys
        {
            guard
                
                let object:Any = dictionary[key],
                let deserialized:String = deserialize(
                    name:key,
                    object:object)
                
            else
            {
                continue
            }
            
            string.append(deserialized)
        }
        
        return string
    }
    
    func deserialize(
        name:String,
        dictionary:[String:Any]) -> String
    {
        var dictionary:[String:Any] = dictionary
        let deserialized:String
        
        if let text:String = dictionary.removeValue(
            forKey:Xml.kTextKey) as? String
        {
            deserialized = deserialize(
                name:name,
                dictionary:dictionary,
                text:text)
        }
        else
        {
            deserialized = deserializeNoText(
                name:name,
                dictionary:dictionary)
        }
        
        return deserialized
    }
    
    func deserialize(
        name:String,
        dictionary:[String:Any],
        text:String) -> String
    {
        let attributes:[String:String] = XmlBuilder.factoryAttributes(
            dictionary:dictionary)
        let openTag:String = XmlBuilder.factoryOpenTag(
            name:name,
            attributes:attributes)
        let closeTag:String = XmlBuilder.factoryCloseTag(
            name:name)
        
        var string:String = String()
        string.append(openTag)
        string.append(text)
        string.append(closeTag)
        
        return string
    }
    
    func deserializeNoText(
        name:String,
        dictionary:[String:Any]) -> String
    {
        let children:[String:Any] = XmlBuilder.factoryChildren(
            dictionary:dictionary)
        let attributes:[String:String] = XmlBuilder.factoryAttributes(
            dictionary:dictionary)
        
        guard
            
            children.count > 0
            
        else
        {
            let openCloseTag:String = XmlBuilder.factoryOpenCloseTag(
                name:name,
                attributes:attributes)
            
            return openCloseTag
        }
        
        let openTag:String = XmlBuilder.factoryOpenTag(
            name:name,
            attributes:attributes)
        let closeTag:String = XmlBuilder.factoryCloseTag(
            name:name)
        
        let deserialized:String = deserialize(
            openTag:openTag,
            closeTag:closeTag,
            children:children)
        
        return deserialized
    }
}
