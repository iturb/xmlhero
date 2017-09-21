import XCTest
@testable import XmlHero

final class TestLoading:XCTestCase
{
    private let kResourceName:String = "mockElements"
    private let kResourceExtension:String = "xml"
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: tests
    
    private func testLoadFile()
    {
        let loadExpectation:XCTestExpectation = expectation(
            description:"load xml")
        
        let bundle:Bundle = Bundle(for:TestLoading.self)
        var loadedXml:Any?
        var loadingError:XmlError?
        
        Xml.object(
            fileName:kResourceName,
            withExtension:kResourceExtension,
            bundle:bundle)
        { (xml:Any?, error:XmlError?) in
            
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
