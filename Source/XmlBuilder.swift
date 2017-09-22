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
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
        }
    }
    
    
}
