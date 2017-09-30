import Foundation

extension Xml
{
    //MARK: internal
    
    class func asyncObject(
        xml:Xml,
        url:URL,
        completion:@escaping(([String:Any]?, XmlError?) -> ()))
    {
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:url,
                options:Data.ReadingOptions.mappedIfSafe)
        }
        catch
        {
            let error:XmlError = XmlError.failedLoadingData()
            completion(nil, error)
            
            return
        }
        
        asyncObject(
            xml:xml,
            data:data,
            completion:completion)
    }
    
    //MARK: open
    
    @discardableResult open class func object(
        url:URL,
        completion:@escaping(([String:Any]?, XmlError?) -> ())) -> Xml
    {
        let xml:Xml = Xml()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncObject(
                xml:xml,
                url:url,
                completion:completion)
        }
        
        return xml
    }
}
