import Foundation

extension XmlBuilder
{
    //MARK: internal
    
    func deserialize(
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
    
    func deserialize(
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
}
