import XCTest
@testable import XmlHero

final class TestElements:XCTestCase
{
    private let kResourceName:String = "mockElements.xml"
    private let kKeyColours:String = "colours"
    private let kKeyRgb:String = "rgb"
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: tests
    
    func testElementsTree()
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
            
            let colours:[String:Any]? = loadedXml?[
                self.kKeyColours] as? [String:Any]
            
            XCTAssertNotNil(
                colours,
                "failed parsing element")
            
            let rgb:[String:Any]? = colours?[
                self.kKeyRgb] as? [String:Any]
            
            XCTAssertNotNil(
                rgb,
                "failed parsing element")
        }
    }
}
