import Foundation

public final class Xml
{
    private(set) var status:XmlStatusProtocol
    
    init()
    {
        status = XmlStatusStandby()
    }
}
