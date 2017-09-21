import Foundation

final class XmlParser:
    NSObject,
    XMLParserDelegate
{
    var root:[XmlElement]
    weak var current:XmlElement?
    private weak var xml:Xml?
    private let parser:XMLParser
    
    init(
        xml:Xml,
        data:Data)
    {
        self.xml = xml
        parser = XMLParser(data:data)
        root = []
        
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
    
    func parsingError(error:XmlError)
    {
        parser.delegate = nil
        xml?.parsingError(error:error)
    }
    
    func parsingFinished(object:Any)
    {
        xml?.parsingFinished(xml:object)
    }
}
