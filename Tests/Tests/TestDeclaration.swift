import XCTest
@testable import XmlHero

final class TestDeclaration:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 1
    private let kDeclaration:String = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>"
    private let kMockObject:Any = [
        "parent":[
            "child":"1"]]
    
    //MARK: private
    
    private func validateDeclaration(data:Data)
    {
        let string:String? = String(
            data:data,
            encoding:String.Encoding.utf8)
        
        XCTAssertNotNil(
            string,
            "failed creating string")
        
        guard
            
            let nonOptionalString:String = string
        
        else
        {
            return
        }
        
        let containsDeclaration:Bool = nonOptionalString.contains(
            kDeclaration)
        
        XCTAssertTrue(
            containsDeclaration,
            "failed to add declaration")
    }
    
    //MARK: tests
    
    func testAddDeclaration()
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

