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
        object:object)
        { (string:String?, error:XmlError?) in
            
            guard
            
                let string:String = string
            
            else
            {
                completion(nil, error)
                
                return
            }
            
            guard
            
                let data:Data = string.data(
                    using:String.Encoding.utf8,
                    allowLossyConversion:false)
            
            else
            {
                let error:XmlError = XmlError.failedCreatingData()
                completion(nil, error)
                
                return
            }
            
            completion(data, error)
        }
    }
    
    private class func asyncString(
        xml:Xml,
        object:Any,
        completion:@escaping((String?, XmlError?) -> ()))
    {
        xml.build(
            object:object,
            completion:completion)
    }
    
    //MARK: internal
    
    @discardableResult open class func string(
        object:Any,
        completion:@escaping((String?, XmlError?) -> ())) -> Xml
    {
        let xml:Xml = Xml()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncString(
                xml:xml,
                object:object,
                completion:completion)
        }
        
        return xml
    }
    
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
