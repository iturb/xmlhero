import Foundation

extension XmlBuilder
{
    //MARK: internal
    
    func deserialize(
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
    
    func deserialize(
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
    
    func deserialize(
        openTag:String,
        closeTag:String,
        value:String) -> String
    {
        var string:String = String()
        string.append(openTag)
        string.append(value)
        string.append(closeTag)
        
        return string
    }
}
