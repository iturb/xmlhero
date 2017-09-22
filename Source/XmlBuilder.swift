import Foundation

final class XmlBuilder
{
    private weak var xml:Xml?
    
    init(
        xml:Xml,
        object:Any)
    {
        self.xml = xml
    }
}
