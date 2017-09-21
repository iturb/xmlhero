import Foundation

public final class Xml
{
    private(set) var status:XmlStatusProtocol
    private var parser:XmlParser?
    private var completion:((Any?, XmlError?) -> ())?
    
    init()
    {
        status = XmlStatusStandby()
    }
    
    //MARK: internal
    
    func parse(
        data:Data,
        completion:@escaping((Any?, XmlError?) -> ()))
    {
        status = XmlStatusParsing()
        
        self.completion = completion
        parser = XmlParser(
            xml:self,
            data:data)
    }
    
    func parsingError(error:XmlError)
    {
        status = XmlStatusError()
        completion?(nil, error)
    }
    
    func parsingFinished(xml:Any)
    {
        status = XmlStatusFinished()
        completion?(xml, nil)
    }
    
    //MARK: public
    
    public func cancel()
    {
        status = XmlStatusCanceled()
        parser?.cancel()
    }
}
