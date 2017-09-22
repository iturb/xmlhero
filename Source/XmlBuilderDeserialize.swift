import Foundation

extension XmlBuilder
{
    //MARK: private
    
    private func deserialize(
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
    
    private func deserialize(
        array:[Any]) -> String
    {
        var string:String = String()
        
        for object:Any in array
        {
            guard
                
                let deserialized:String = deserialize(
                    object:object)
                
            else
            {
                continue
            }
            
            string.append(deserialized)
        }
        
        return string
    }
    
    private func deserialize(
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
    
    private func deserialize(
        name:String,
        array:[Any]) -> String
    {
        let openTag:String = XmlBuilder.factoryOpenTag(
            name:name,
            attributes:nil)
        let closeTag:String = XmlBuilder.factoryCloseTag(
            name:name)
        
        let deserialized:String = deserialize(
            openTag:openTag,
            closeTag:closeTag,
            array:array)
        
        return deserialized
    }
    
    private func deserialize(
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
    
    private func deserializeNoText(
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
    
    private func deserialize(
        openTag:String,
        closeTag:String,
        children:[String:Any]) -> String
    {
        var string:String = String()
        string.append(openTag)
        
        let keys:[String] = Array(children.keys)
        
        for key:String in keys
        {
            guard
                
                let object:Any = children[key],
                let deserialized:String = deserialize(
                    name:key,
                    object:object)
                
            else
            {
                continue
            }
            
            string.append(deserialized)
        }
        
        string.append(closeTag)
        
        return string
    }
    
    private func deserialize(
        openTag:String,
        closeTag:String,
        array:[Any]) -> String
    {
        var string:String = String()
        string.append(openTag)
        
        for object:Any in array
        {
            guard
                
                let deserialized:String = deserialize(
                    object:object)
                
            else
            {
                continue
            }
            
            string.append(deserialized)
        }
        
        string.append(closeTag)
        
        return string
    }
    
    private func deserialize(
        name:String,
        object:Any) -> String?
    {
        let deserialized:String?
        
        if let dictionary:[String:Any] = object as? [String:Any]
        {
            deserialized = deserialize(
                name:name,
                dictionary:dictionary)
        }
        else if let array:[Any] = object as? [Any]
        {
            deserialized = deserialize(
                name:name,
                array:array)
        }
        else
        {
            deserialized = nil
        }
        
        return deserialized
    }
    
    //MARK: internal
    
    func deserialize(object:Any) -> String?
    {
        let deserialized:String?
        
        if let dictionary:[String:Any] = object as? [String:Any]
        {
            deserialized = deserialize(dictionary:dictionary)
        }
        else if let array:[Any] = object as? [Any]
        {
            deserialized = deserialize(array:array)
        }
        else if let string:String = object as? String
        {
            deserialized = string
        }
        else
        {
            deserialized = nil
        }
        
        return deserialized
    }
}
