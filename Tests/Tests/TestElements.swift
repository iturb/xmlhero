import XCTest
@testable import XmlHero

final class TestElements:XCTestCase
{
    private var xml:Any?
    private let kResourceName:String = "mockElements"
    private let kResourceExtension:String = "xml"
    
    override func setUp()
    {
        super.setUp()
        
        let bundle:Bundle = Bundle(for:TestElements.self)
        
        Xml.object(
            fileName:kResourceName,
            withExtension:kResourceExtension,
            bundle:bundle)
        { (xml:Any?, error:XmlError?) in
            
            self.xml = xml
        }
    }
}
