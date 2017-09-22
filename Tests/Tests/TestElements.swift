import XCTest
@testable import XmlHero

final class TestElements:XCTestCase
{
    private let kResourceName:String = "mockElements.xml"
    private let kKeyColours:String = "colours"
    private let kKeyRgb:String = "rgb"
    private let kKeyRed:String = "red"
    private let kKeySpanishName:String = "spanishName"
    private let kWaitExpectation:TimeInterval = 1
    
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
            
            let red:[String:Any]? = rgb?[
                self.kKeyRed] as? [String:Any]
            
            XCTAssertNotNil(
                red,
                "failed parsing element")
        }
    }
    
    func testElementsAttributes()
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
            
            let colours:[String:Any]? = loadedXml?[
                self.kKeyColours] as? [String:Any]
            
            let rgb:[String:Any]? = colours?[
                self.kKeyRgb] as? [String:Any]
            
            let red:[String:Any]? = rgb?[
                self.kKeyRed] as? [String:Any]
            
            let spanishName:String? = red?[
                self.kKeySpanishName] as? String
            
            XCTAssertNotNil(
                spanishName,
                "failed parsing element")
        }
    }
}
