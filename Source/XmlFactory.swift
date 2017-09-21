import Foundation

extension Xml
{
    //MARK: private
    
    private class func url(
        fileName:String,
        withExtension:String,
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
            withExtension:withExtension)
        
        return url
    }
    
    private class func asyncObject(
        fileName:String,
        withExtension:String,
        bundle:Bundle?,
        completion:@escaping((Any?, XmlError?) -> ()))
    {
        guard
            
            let url:URL = url(
                fileName:fileName,
                withExtension:withExtension,
                bundle:bundle)
            
        else
        {
            let error:XmlError = XmlError.fileNotFound()
            completion(nil, error)
            
            return
        }
    }
    
    //MARK: open
    
    open class func object(
        fileName:String,
        withExtension:String,
        bundle:Bundle?,
        completion:@escaping((Any?, XmlError?) -> ()))
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        {
            asyncObject(
                fileName:fileName,
                withExtension:withExtension,
                bundle:bundle,
                completion:completion)
        }
    }
    
    open class func object(
        url:URL,
        completion:@escaping((Any?, XmlError?) -> ()))
    {
    }
    
    open class func object(
        data:Data,
        completion:@escaping((Any?, XmlError?) -> ()))
    {
        
    }
}
