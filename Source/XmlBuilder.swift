import Foundation

final class XmlBuilder
{
    private weak var xml:Xml?
    
    init(
        xml:Xml,
        object:Any)
    {
        self.xml = xml
        let string:String? = deserialize(object:object)
        deserialized(string:string)
    }
    
    //MARK: private
    
    private func deserialized(string:String?)
    {
        guard
        
            let string:String = string,
            let data:Data = string.data(
                using:String.Encoding.utf8,
                allowLossyConversion:false)
        
        else
        {
            let error:XmlError = XmlError.failedDeserializing()
            xml?.buildingError(error:error)
            
            return
        }
        
        xml?.buildingFinished(data:data)
    }
}
