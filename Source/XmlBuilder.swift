import Foundation

final class XmlBuilder
{
    private weak var xml:Xml?
    
    init(
        xml:Xml,
        object:Any)
    {
        self.xml = xml
        
        guard
            
            let string:String = deserialize(object:object)
        
        else
        {
            failed()
            
            return
        }
        
        deserialized(string:string)
    }
    
    //MARK: private
    
    private func failed()
    {
        let error:XmlError = XmlError.failedDeserializing()
        xml?.buildingError(error:error)
    }
    
    private func addHeader(string:String) -> String
    {
        var headered:String = XmlBuilder.factoryHeader()
        headered.append(string)
        
        return headered
    }
    
    private func deserialized(string:String)
    {
        let headered:String = addHeader(string:string)
        
        xml?.buildingFinished(string:headered)
    }
}
