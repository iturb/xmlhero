import Foundation

extension XmlBuilder
{
    //MARK: private
    
    private func valueToString(value:Any) -> String
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
    
    func deserialize(
        name:String,
        value:Any) -> String
    {
        let stringValue:String = valueToString(
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
