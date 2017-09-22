import Foundation

public final class Xml
{
    private(set) var status:XmlStatusProtocol
    private var parser:XmlParser?
    private var completionParsing:(([String:Any]?, XmlError?) -> ())?
    
    init()
    {
        status = XmlStatusStandby()
    }
    
    //MARK: internal
    
    func parse(
        data:Data,
        completion:@escaping(([String:Any]?, XmlError?) -> ()))
    {
        status = XmlStatusParsing()
        
        self.completionParsing = completion
        parser = XmlParser(
            xml:self,
            data:data)
    }
    
    func parsingError(error:XmlError)
    {
        status = XmlStatusError()
        completionParsing?(nil, error)
        completionParsing = nil
    }
    
    func parsingFinished(xml:[String:Any])
    {
        status = XmlStatusFinished()
        completionParsing?(xml, nil)
        completionParsing = nil
    }
    
    //MARK: public
    
    public func cancel()
    {
        status = XmlStatusCanceled()
        parser?.cancel()
        completionParsing = nil
    }
}
