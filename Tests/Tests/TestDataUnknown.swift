import XCTest
@testable import XmlHero

final class TestDataUnknown:XCTestCase
{
    private let kResourceName:String = "data.unknown"
    private let kWaitExpectation:TimeInterval = 1
    
    //MARK: tests
    
    func testLoadingData()
    {
        let loadExpectation:XCTestExpectation = expectation(
            description:"load xml")
        
        let bundle:Bundle = Bundle(for:TestDataUnknown.self)
        var loadedXml:[String:Any]?
        var loadingError:XmlError?
        
        Xml.object(
            fileName:kResourceName,
            bundle:bundle)
        { (xml:[String:Any]?, error:XmlError?) in
            
            loadedXml = xml
            loadingError = error
            
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                loadedXml,
                "failed loading xml")
            
            XCTAssertNil(
                loadingError,
                "found error while loading")
        }
    }
}
