import Foundation

extension Xml
{
    //MARK: private
    
    private class func stringFrom(data:Data) -> String?
    {
        let string:String? = String(data:data, encoding:String.Encoding.ascii)
        
        return string
    }
    
    private class func dataFrom(string:String) -> Data?
    {
        let data:Data? = string.data(
            using:String.Encoding.ascii,
            allowLossyConversion:false)
        
        return data
    }
    
    private class func cleanBoomCharacters(string:String) -> String
    {
        var mutableString:String = string
        mutableString = removeBoomBeginning(string:mutableString)
        mutableString = removeBoomEnding(string:mutableString)
        
        return mutableString
    }
    
    private class func removeBoomBeginning(string:String) -> String
    {
        var index:Int = 0
        
        for character:Character in string
        {
            if character == "<"
            {
                break
            }
            
            index += 1
        }
        
        var mutableString:String = string
        let startIndex:String.Index = mutableString.startIndex
        let endIndex:String.Index = mutableString.index(
            mutableString.startIndex,
            offsetBy:index)
        let removeRange:Range<String.Index> = Range<String.Index>(
             startIndex ..< endIndex)
        mutableString.removeSubrange(removeRange)
        
        return mutableString
    }
    
    private class func removeBoomEnding(string:String) -> String
    {
        var mutableString:String = string
        var count:Int = string.count - 1
        
        while count >= 0
        {
            let index:String.Index = mutableString.index(
                mutableString.startIndex,
                offsetBy:count)
            let character:Character = mutableString.characters[index]
            
            if character == ">"
            {
                break
            }
            
            mutableString.remove(at:index)
            count -= 1
        }
        
        return mutableString
    }
    
    //MARK: internal
    
    class func cleanData(data:Data) -> Data
    {
        guard
        
            let string:String = stringFrom(data:data)
        
        else
        {
            return data
        }
        
        let cleanedString:String = cleanBoomCharacters(string:string)
        
        guard
        
            let cleanedData:Data = dataFrom(string:cleanedString)
        
        else
        {
            return data
        }
        
        return cleanedData
    }
}
