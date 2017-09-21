import Foundation

extension XmlError
{
    //MARK: private
    
    private static func errorWithKey(key:String) -> XmlError
    {
        let description:String = stringForKey(
            key:key)
        let error:XmlError = XmlError(
            localizedDescription:description)
        
        return error
    }
    
    private static func stringForKey(key:String) -> String
    {
        let bundle:Bundle = Bundle(for:Xml.self)
        let string:String = NSLocalizedString(
            key,
            tableName:nil,
            bundle:bundle,
            value:"",
            comment:"")
        
        return string
    }
    
    //MARK: internal
    
    static func fileNotFound() -> XmlError
    {
        let error:XmlError = errorWithKey(
            key:"XmlError_fileNotFound")
        
        return error
    }
    
    static func failedLoadingData() -> XmlError
    {
        let error:XmlError = errorWithKey(
            key:"XmlError_failedLoadingData")
        
        return error
    }
    
    static func failedParsing() -> XmlError
    {
        let error:XmlError = errorWithKey(
            key:"XmlError_failedParsing")
        
        return error
    }
    
    static func failedSerializing() -> XmlError
    {
        let error:XmlError = errorWithKey(
            key:"XmlError_failedSerializing")
        
        return error
    }
}
