import Foundation

public final class Xml
{
    static let kTextKey:String = "text"
    private(set) public var status:XmlStatus
    private var parser:XmlParser?
    private var builder:XmlBuilder?
    private var completionParsing:(([String:Any]?, XmlError?) -> ())?
    private var completionBuilding:((Data?, XmlError?) -> ())?
    
    init()
    {
        status = XmlStatus.standby
    }
    
    //MARK: internal
    
    func parse(
        data:Data,
        completion:@escaping(([String:Any]?, XmlError?) -> ()))
    {
        status = XmlStatus.parsing
        
        self.completionParsing = completion
        parser = XmlParser(
            xml:self,
            data:data)
    }
    
    func build(
        object:Any,
        completion:@escaping((Data?, XmlError?) -> ()))
    {
        status = XmlStatus.building
        
        self.completionBuilding = completion
        builder = XmlBuilder(
            xml:self,
            object:object)
    }
    
    func parsingError(error:XmlError)
    {
        status = XmlStatus.error
        
        completionParsing?(nil, error)
        parser = nil
        completionParsing = nil
    }
    
    func parsingFinished(xml:[String:Any])
    {
        status = XmlStatus.finished
        
        completionParsing?(xml, nil)
        parser = nil
        completionParsing = nil
    }
    
    func buildingError(error:XmlError)
    {
        status = XmlStatus.error
        
        completionBuilding?(nil, error)
        builder = nil
        completionBuilding = nil
    }
    
    func buildingFinished(data:Data)
    {
        status = XmlStatus.finished
        
        completionBuilding?(data, nil)
        builder = nil
        completionBuilding = nil
    }
    
    //MARK: public
    
    public func cancel()
    {
        status = XmlStatus.canceled
        
        parser?.cancel()
        parser = nil
        builder = nil
        completionParsing = nil
        completionBuilding = nil
    }
}
