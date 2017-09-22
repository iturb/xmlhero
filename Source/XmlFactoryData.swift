import Foundation

extension Xml
{
    //MARK: private
    
    private class func asyncData(
        xml:Xml,
        object:Any,
        completion:@escaping((Data?, XmlError?) -> ()))
    {
        xml.build(
            object:object,
            completion:completion)
    }
    
    //MARK: internal
    
    @discardableResult open class func data(
        object:Any,
        completion:@escaping((Data?, XmlError?) -> ())) -> Xml
    {
        let xml:Xml = Xml()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncData(
                xml:xml,
                object:object,
                completion:completion)
        }
        
        return xml
    }
}
