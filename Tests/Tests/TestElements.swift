import XCTest
@testable import XmlHero

final class TestElements:XCTestCase
{
    private var xml:Any?
    private let kResourceName:String = "mockElements"
    private let kResourceExtension:String = "xml"
    private let kKeyColours:String = "colours"
    private let kKeyRgb:String = "rgb"
    
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
    
    //MARK: tests
    
    func testElementsTree()
    {
        let dictionary:[String:Any]? = xml as? [String:Any]
        
        XCTAssertNotNil(
            dictionary,
            "failed parsing dictionary")
        
        let colours:[String:Any]? = dictionary?[kKeyColours] as? [String:Any]
        
        XCTAssertNotNil(
            colours,
            "failed parsing element")
        
        let rgb:[String:Any]? = colours?[kKeyRgb] as? [String:Any]
        
        XCTAssertNotNil(
            rgb,
            "failed parsing element")
    }
}
