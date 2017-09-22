import Foundation

public final class Xml
{
    private(set) var status:XmlStatusProtocol
    private var parser:XmlParser?
    private var builder:XmlBuilder?
    private var completionParsing:(([String:Any]?, XmlError?) -> ())?
    private var completionBuilding:((Data?, XmlError?) -> ())?
    
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
    
    func build(
        object:Any,
        completion:@escaping((Data?, XmlError?) -> ()))
    {
        self.completionBuilding = completion
        builder = XmlBuilder(
            xml:self,
            object:object)
    }
    
    func parsingError(error:XmlError)
    {
        status = XmlStatusError()
        completionParsing?(nil, error)
        parser = nil
        completionParsing = nil
    }
    
    func parsingFinished(xml:[String:Any])
    {
        status = XmlStatusFinished()
        completionParsing?(xml, nil)
        parser = nil
        completionParsing = nil
    }
    
    //MARK: public
    
    public func cancel()
    {
        status = XmlStatusCanceled()
        parser?.cancel()
        parser = nil
        builder = nil
        completionParsing = nil
        completionBuilding = nil
    }
}
