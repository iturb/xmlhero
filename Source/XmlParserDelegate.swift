import Foundation

extension XmlParser
{
    //MARK: delegate
    
    func parserDidStartDocument(
        _ parser:XMLParser)
    {
        
    }
    
    func parserDidEndDocument(
        _ parser:XMLParser)
    {
        
    }
    
    func parser(
        _ parser:XMLParser,
        parseErrorOccurred parseError:Error)
    {
        
    }
    
    func parser(
        _ parser:XMLParser,
        didStartElement elementName:String,
        namespaceURI:String?,
        qualifiedName qName:String?,
        attributes attributeDict:[String:String] = [:])
    {
        
    }
    
    func parser(
        _ parser:XMLParser,
        didEndElement elementName:String,
        namespaceURI:String?,
        qualifiedName qName:String?)
    {
        
    }
}
