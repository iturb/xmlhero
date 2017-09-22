import Foundation

extension XmlBuilder
{
    private static let kDeclaration:String = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
    
    //MARK: internal
    
    class func factoryHeader() -> String
    {
        return kDeclaration
    }
}
