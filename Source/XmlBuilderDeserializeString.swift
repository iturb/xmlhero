import Foundation

extension XmlBuilder
{
    //MARK: private
    
    private class func valueToString(value:Any) -> String
    {
        guard
        
            let stringValue:String = value as? String
        
        else
        {
            let stringValue:String = String(describing:value)
            
            return stringValue
        }
        
        return stringValue
    }
    
    //MARK: internal
    
    class func anyToString(value:Any) -> String?
    {
        let nullValue:NSNull? = value as? NSNull
        let dictValue:[String:Any]? = value as? [String:Any]
        let arrayValue:[Any]? = value as? [Any]
        
        guard
        
            nullValue == nil,
            dictValue == nil,
            arrayValue == nil
        
        else
        {
            return nil
        }
        
        let string:String = valueToString(value:value)
        
        return string
    }
    
    func deserialize(
        name:String,
        value:Any) -> String
    {
        let stringValue:String = XmlBuilder.valueToString(
            value:value)
        let openTag:String = XmlBuilder.factoryOpenTag(
            name:name,
            attributes:nil)
        let closeTag:String = XmlBuilder.factoryCloseTag(
            name:name)
        
        let deserialized:String = deserialize(
            openTag:openTag,
            closeTag:closeTag,
            value:stringValue)
        
        return deserialized
    }
}
