import XCTest
@testable import XmlHero

final class TestDataUnknown:XCTestCase
{
    private var xml:Any?
    private var error:XmlError?
    private let kResourceName:String = "data"
    private let kResourceExtension:String = "unknown"
    
    override func setUp()
    {
        super.setUp()
        
        let bundle:Bundle = Bundle(for:TestDataUnknown.self)
        
        Xml.object(
            fileName:kResourceName,
            withExtension:kResourceExtension,
            bundle:bundle)
        { (xml:Any?, error:XmlError?) in
            
            self.xml = xml
            self.error = error
        }
    }
    
    //MARK: tests
    
    func testLoadingData()
    {
        XCTAssertNil(
            error,
            "error should be nil")
        
        XCTAssertNotNil(
            xml,
            "failed loading xml")
    }
}
