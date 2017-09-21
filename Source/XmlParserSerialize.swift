import Foundation

extension XmlParser
{
    //MARK: private
    
    private func serializeArray(
        name:String,
        elements:[XmlElement]) -> Any
    {
        var dictionary:[String:[Any]] = [:]
        var array:[Any] = []
        dictionary[name] = array
        
        for element:XmlElement in elements
        {
            guard
            
                let serialized:Any = serialize(xml:element)
            
            else
            {
                continue
            }
            
            array.append(serialized)
        }
        
        return dictionary
    }
    
    private func serializeDictionary(elements:[XmlElement]) -> Any
    {
        var dictionary:[String:Any] = [:]
        
        for element:XmlElement in elements
        {
            guard
                
                let serialized:Any = serialize(xml:element)
                
            else
            {
                continue
            }
            
            dictionary[element.name] = serialized
        }
        
        return dictionary
    }
    
    private func serialize(xml:XmlElement) -> Any?
    {
        if let children:[XmlElement] = xml.children
        {
            let serialized:Any? = serialize(elements:children)
            
            return serialized
        }
        else if let value:String = xml.value
        {
            let dictionary:[String:String] = [
                xml.name:value]
            
            return dictionary
        }
        
        return nil
    }
    
    //MARK: internal
    
    func serialize(elements:[XmlElement]) -> Any?
    {
        guard
            
            let first:XmlElement = elements.first
            
        else
        {
            return nil
        }
        
        let count:Int = elements.count
        
        if count > 1
        {
            guard
                
                let last:XmlElement = elements.last
                
            else
            {
                return nil
            }
            
            if first.name == last.name
            {
                let serialized:Any = serializeArray(
                    name:first.name,
                    elements:elements)
                
                return serialized
            }
            else
            {
                let serialized:Any = serializeDictionary(
                    elements:elements)
                
                return serialized
            }
        }
        else
        {
            let serialized:Any? = serialize(xml:first)
            
            return serialized
        }
    }
}
