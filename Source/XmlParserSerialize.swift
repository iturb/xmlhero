import Foundation

extension XmlParser
{    
    //MARK: private
    
    private func serializeArray(
        name:String,
        elements:[XmlElement]) -> [String:Any]
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
    
    private func serializeDictionary(elements:[XmlElement]) -> [String:Any]
    {
        var dictionary:[String:Any] = [:]
        
        for element:XmlElement in elements
        {   
            let serialized:Any = serialize(xml:element)
            dictionary[element.name] = serialized
        }
        
        return dictionary
    }
    
    private func serialize(xml:XmlElement) -> [String:Any]
    {
        var serialized:[String:Any] = [:]
        
        if let children:[XmlElement] = xml.children
        {
            serialized = serialize(elements:children)
        }
        else if let value:String = xml.value
        {
            serialized[Xml.kTextKey] = value
        }
        
        let serializedAttributed:[String:Any] = attribute(
            xml:xml,
            serialized:serialized)
        
        return serializedAttributed
    }
    
    private func attribute(
        xml:XmlElement,
        serialized:[String:Any]) -> [String:Any]
    {
        var mutable:[String:Any] = serialized
        
        if let attributes:[String:String] = xml.attributes
        {
            let keys:[String] = Array(attributes.keys)
            
            for key:String in keys
            {
                mutable[key] = attributes[key]
            }
        }
        
        return mutable
    }
    
    //MARK: internal
    
    func serialize(elements:[XmlElement]) -> [String:Any]
    {
        guard
            
            let first:XmlElement = elements.first,
            let last:XmlElement = elements.last
            
        else
        {
            let dictionary:[String:Any] = [:]
            
            return dictionary
        }
        
        let serialized:[String:Any]
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
