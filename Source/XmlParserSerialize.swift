import Foundation

extension XmlParser
{    
    //MARK: private
    
    private func serializeGrouped(
        array:[XmlElement]) -> Any?
    {
        let serialized:Any
        
        if array.count > 1
        {
            serialized = serializeArray(
                elements:array)
        }
        else
        {
            guard
                
                let first:XmlElement = array.first
                
            else
            {
                return nil
            }
            
            serialized = serialize(
                xml:first)
        }
        
        return serialized
    }
    
    private func serializeArray(
        elements:[XmlElement]) -> [Any]
    {
        var array:[Any] = []
        
        for element:XmlElement in elements
        {
            let serialized:Any = serialize(xml:element)
            array.append(serialized)
        }
        
        return array
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
    
    private func groupElements(
        elements:[XmlElement]) -> [String:[XmlElement]]
    {
        var group:[String:[XmlElement]] = [:]
        
        for element:XmlElement in elements
        {
            let name:String = element.name
            var array:[XmlElement]
            
            if let existingArray:[XmlElement] = group[name]
            {
                array = existingArray
            }
            else
            {
                array = []
            }
            
            array.append(element)
            
            group[name] = array
        }
        
        return group
    }
    
    //MARK: internal
    
    func serialize(elements:[XmlElement]) -> [String:Any]
    {
        let grouped:[String:[XmlElement]] = groupElements(
            elements:elements)
        let keys:[String] = Array(grouped.keys)
        var serialized:[String:Any] = [:]
        
        for key:String in keys
        {
            guard
            
                let array:[XmlElement] = grouped[key],
                let element:Any = serializeGrouped(
                    array:array)
            
            else
            {
                continue
            }
            
            serialized[key] = element
        }
        
        return serialized
    }
}
