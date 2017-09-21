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
    
    //MARK: open
    
    open class func object(
        fileName:String,
        withExtension:String,
        bundle:Bundle?,
        completion:@escaping((Any?, Error?) -> ()))
    {
        guard
        
            let url:URL = url(
                fileName:fileName,
                withExtension:withExtension,
                bundle:bundle)
        
        else
        {
            completion(nil, nil)
            
            return
        }
    }
    
    open class func object(
        url:URL,
        completion:@escaping((Any?, Error?) -> ()))
    {
    }
    
    open class func object(
        data:Data,
        completion:@escaping((Any?, Error?) -> ()))
    {
        
    }
}
