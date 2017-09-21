import Foundation

final class XmlParser:
    NSObject,
    XMLParserDelegate
{
    var stack:[Any]
    private weak var xml:Xml?
    private let parser:XMLParser
    
    init(
        xml:Xml,
        data:Data)
    {
        self.xml = xml
        parser = XMLParser(data:data)
        stack = []
        
        super.init()
        
        parser.delegate = self
        parser.parse()
    }
    
    //MARK: internal
    
    func cancel()
    {
        parser.delegate = nil
        parser.abortParsing()
    }
}
