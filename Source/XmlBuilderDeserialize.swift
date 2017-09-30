import Foundation

extension XmlBuilder
{
    //MARK: internal
    
    func deserialize(object:Any) -> String?
    {
        let deserialized:String?
        
        if let dictionary:[String:Any] = object as? [String:Any]
        {
            deserialized = deserialize(dictionary:dictionary)
        }
        else if let array:[Any] = object as? [Any]
        {
            deserialized = deserialize(array:array)
        }
        else if let string:String = object as? String
        {
            deserialized = string
        }
        else if let _:NSNull = object as? NSNull
        {
            deserialized = nil
        }
        else
        {
            deserialized = String(describing:object)
        }
        
        return deserialized
    }
    
    func deserialize(
        name:String,
        object:Any) -> String?
    {
        let deserialized:String?
        
        if let dictionary:[String:Any] = object as? [String:Any]
        {
            deserialized = deserialize(
                name:name,
                dictionary:dictionary)
        }
        else if let array:[Any] = object as? [Any]
        {
            deserialized = deserialize(
                name:name,
                array:array)
        }
        else
        {
            deserialized = nil
        }
        
        return deserialized
    }
}
