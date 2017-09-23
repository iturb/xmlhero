import XCTest
@testable import XmlHero

final class TestParsingArrays:XCTestCase
{
    private let kResourceName:String = "arrays.xml"
    private let kWaitExpectation:TimeInterval = 1
    
    //MARK: tests
    
    func testArrayElements()
    {
        let loadExpectation:XCTestExpectation = expectation(
            description:"load xml")
        
        let bundle:Bundle = Bundle(for:TestElements.self)
        var loadedXml:[String:Any]?
        
        Xml.object(
            fileName:kResourceName,
            bundle:bundle)
        { (xml:[String:Any]?, error:XmlError?) in
            
            loadedXml = xml
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                loadedXml,
                "failed parsing dictionary")
        }
    }
}
