import Foundation

extension XmlParser
{
    //MARK: delegate
    
    func parserDidEndDocument(
        _ parser:XMLParser)
    {        
        let serialized:[String:Any] = serialize(elements:root)
        parsingFinished(xml:serialized)
    }
    
    func parser(
        _ parser:XMLParser,
        parseErrorOccurred parseError:Error)
    {
        let error:XmlError = XmlError.failedParsing()
        parsingError(error:error)
    }
    
    func parser(
        _ parser:XMLParser,
        didStartElement elementName:String,
        namespaceURI:String?,
        qualifiedName qName:String?,
        attributes attributeDict:[String:String] = [:])
    {
        let element:XmlElement = XmlElement(
            name:elementName,
            parent:current,
            attributes:attributeDict)
        
        if let current:XmlElement = self.current
        {
            current.addChild(child:element)
        }
        else
        {
            root.append(element)
        }
        
        current = element
    }
    
    func parser(
        _ parser:XMLParser,
        didEndElement elementName:String,
        namespaceURI:String?,
        qualifiedName qName:String?)
    {
        current = current?.parent
    }
    
    func parser(
        _ parser:XMLParser,
        foundCharacters string:String)
    {
        current?.append(string:string)
    }
}
