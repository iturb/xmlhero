import XCTest
@testable import XmlHero

final class TestNonStrings:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 1
    private let kPrimitiveA:UInt32 = 456
    private let kPrimitiveB:UInt16 = 128
    private let kPrimitiveC:Float = 127.9
    
    //MARK: private
    
    private func mockPrimitivesObject() -> Any
    {
        let object:Any = [
            "parent":[
                "a":kPrimitiveA,
                "b":kPrimitiveB,
                "c":kPrimitiveC]]
        
        return object
    }
    
    private func validatePrimitives(
        string:String)
    {
        
    }
    
    //MARK: tests
    
    func testBuildingPrimitives()
    {
        let buildExpectation:XCTestExpectation = expectation(
            description:"build xml")
        let object:Any = mockPrimitivesObject()
        
        var string:String?
        
        Xml.string(object:object)
        { (xmlString:String?, error:XmlError?) in
            string = xmlString
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                string,
                "failed building xml")
            
            guard
                
                let string:String = string
            else
            {
                return
            }
            
            self.validatePrimitives(string:string)
        }
    }
}
