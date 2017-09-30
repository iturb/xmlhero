import XCTest
@testable import XmlHero

final class TestNonStrings:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 1
    private let kKeyParent:String = "parent"
    private let kKeyA:String = "childA"
    private let kKeyB:String = "childB"
    private let kKeyC:String = "childC"
    private let kPrimitiveA:UInt32 = 456
    private let kPrimitiveB:UInt16 = 128
    private let kPrimitiveC:Float = 127.9
    
    //MARK: private
    
    private func mockPrimitivesObject() -> Any
    {
        let object:Any = [
            kKeyParent:[
                kKeyA:kPrimitiveA,
                kKeyB:kPrimitiveB,
                kKeyC:kPrimitiveC]]
        
        return object
    }
    
    private func validatePrimitives(
        string:String)
    {
        print(string)
        
        let mockPrimitiveB:String = "\(kPrimitiveB)"
        let mockPrimitiveC:String = "\(kPrimitiveC)"
        
        XCTAssertTrue(
            string.contains(kKeyParent),
            "Parent not in string")
        
        XCTAssertTrue(
            string.contains(kKeyA),
            "Child not in string")
        
        XCTAssertTrue(
            string.contains(mockPrimitiveB),
            "Primitive not parsed correctly")
        
        XCTAssertTrue(
            string.contains(mockPrimitiveC),
            "Primitive not parsed correctly")
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
            buildExpectation.fulfill()
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
