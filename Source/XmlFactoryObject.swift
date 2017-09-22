import Foundation

extension Xml
{
    private static let kNoExtension:String = String()
    
    //MARK: private
    
    private class func url(
        fileName:String,
        bundle:Bundle?) -> URL?
    {
        let useBundle:Bundle
        
        if let receivedBundle:Bundle = bundle
        {
            useBundle = receivedBundle
        }
        else
        {
            useBundle = Bundle.main
        }
        
        let url:URL? = useBundle.url(
            forResource:fileName,
            withExtension:Xml.kNoExtension)
        
        return url
    }
    
    private class func asyncObject(
        xml:Xml,
        fileName:String,
        bundle:Bundle?,
        completion:@escaping(([String:Any]?, XmlError?) -> ()))
    {
        guard
            
            let url:URL = url(
                fileName:fileName,
                bundle:bundle)
            
        else
        {
            let error:XmlError = XmlError.fileNotFound()
            completion(nil, error)
            
            return
        }
        
        asyncObject(
            xml:xml,
            url:url,
            completion:completion)
    }
    
    private class func asyncObject(
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
    
    private class func asyncObject(
        xml:Xml,
        data:Data,
        completion:@escaping(([String:Any]?, XmlError?) -> ()))
    {
        let dataCleaned:Data = cleanData(data:data)
        
        xml.parse(
            data:dataCleaned,
            completion:completion)
    }
    
    //MARK: open
    
    @discardableResult open class func object(
        fileName:String,
        bundle:Bundle? = nil,
        completion:@escaping(([String:Any]?, XmlError?) -> ())) -> Xml
    {
        let xml:Xml = Xml()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncObject(
                xml:xml,
                fileName:fileName,
                bundle:bundle,
                completion:completion)
        }
        
        return xml
    }
    
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
    
    @discardableResult open class func object(
        data:Data,
        completion:@escaping(([String:Any]?, XmlError?) -> ())) -> Xml
    {
        let xml:Xml = Xml()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncObject(
                xml:xml,
                data:data,
                completion:completion)
        }
        
        return xml
    }
}
