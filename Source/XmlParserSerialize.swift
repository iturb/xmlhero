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
            let serialized:Any = serialize(xml:element)
            array.append(serialized)
        }
        
        return dictionary
    }
    
    private func serializeDictionary(elements:[XmlElement]) -> Any
    {
        var dictionary:[String:Any] = [:]
        
        for element:XmlElement in elements
        {   
            let serialized:Any = serialize(xml:element)
            dictionary[element.name] = serialized
        }
        
        return dictionary
    }
    
    private func serialize(xml:XmlElement) -> Any
    {
        if let children:[XmlElement] = xml.children
        {
            let serialized:Any = serialize(elements:children)
            
            return serialized
        }
        else if let value:String = xml.value
        {
            return value
        }
        
        let dictionary:[String:Any] = [:]
        
        return dictionary
    }
    
    //MARK: internal
    
    func serialize(elements:[XmlElement]) -> Any
    {
        guard
            
            let first:XmlElement = elements.first,
            let last:XmlElement = elements.last
            
        else
        {
            let dictionary:[String:Any] = [:]
            
            return dictionary
        }
        
        let serialized:Any
        let count:Int = elements.count
        
        if count > 1 && first.name == last.name
        {
            serialized = serializeArray(
                name:first.name,
                elements:elements)
        }
        else
        {
            serialized = serializeDictionary(
                elements:elements)
        }
        
        return serialized
    }
}
