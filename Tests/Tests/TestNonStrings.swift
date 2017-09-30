import XCTest
@testable import XmlHero

final class TestNonStrings:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 1
    
    //MARK: tests
    
    func testBuildingPrimitives()
    {
        let buildExpectation:XCTestExpectation = expectation(
            description:"build xml")
        
        var data:Data?
        
        Xml.data(object:kMockObject)
        { (xmlData:Data?, error:XmlError?) in
            
            data = xmlData
            buildExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                data,
                "failed building xml")
            
            guard
                
                let data:Data = data
                
                else
            {
                return
            }
            
            self.validateDeclaration(data:data)
        }
    }
}
