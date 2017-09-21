import Foundation

extension XmlError
{
    //MARK: private
    
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
        let description:String = stringForKey(
            key:"XmlError_fileNotFound")
        let error:XmlError = XmlError(
            localizedDescription:description)
        
        return error
    }
}
