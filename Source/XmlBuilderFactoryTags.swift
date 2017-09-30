import Foundation

extension XmlBuilder
{
    private static let kOpenTag:String = "<%@>"
    private static let kCloseTag:String = "</%@>"
    private static let kOpenCloseTag:String = "<%@ />"
    
    //MARK: internal
    
    class func factoryOpenCloseTag(
        name:String,
        attributes:[String:String]?) -> String
    {
        let merged:String = mergeAttributes(
            name:name,
            attributes:attributes)
        let tag:String = String(
            format:kOpenCloseTag,
            merged)
        
        return tag
    }
    
    class func factoryOpenTag(
        name:String,
        attributes:[String:String]?) -> String
    {
        let merged:String = mergeAttributes(
            name:name,
            attributes:attributes)
        let tag:String = String(
            format:kOpenTag,
            merged)
        
        return tag
    }
    
    class func factoryCloseTag(name:String) -> String
    {
        let tag:String = String(
            format:kCloseTag,
            name)
        
        return tag
    }
}
