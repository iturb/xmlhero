import XCTest
@testable import XmlHero

final class TestParsingArrays:XCTestCase
{
    private let kResourceName:String = "arrays.xml"
    private let kKeyCapabilities:String = "capabilityInfo"
    private let kKeyFunction:String = "function"
    private let kKeyFunctionType:String = "type"
    private let kKeyFormat:String = "format"
    private let kKeyFormatContentType:String = "contentType"
    private let kKeyOption:String = "option"
    private let kKeyOptionName:String = "name"
    private let kExpectedFunctions:Int = 9
    private let kWaitExpectation:TimeInterval = 1
    
    //MARK: private
    
    private func checkElements(xml:[String:Any])
    {
        let capabilities:[String:Any]? = xml[kKeyCapabilities] as? [String:Any]
        
        XCTAssertNotNil(
            capabilities,
            "failed parsing element")
        
        let function:[Any]? = capabilities?[kKeyFunction] as? [Any]
        
        XCTAssertNotNil(
            function,
            "failed parsing element")
        
        guard
        
            let functionArray:[Any] = function
        
        else
        {
            return
        }
        
        let countFunctions:Int = functionArray.count
        
        XCTAssertEqual(
            countFunctions,
            kExpectedFunctions,
            "failed parsing all functions")
        
        guard
            
            let first:Any = functionArray.first,
            let element:[String:Any] = first as? [String:Any]
        
        else
        {
            return
        }
        
        checkFunction(xml:element)
    }
    
    private func checkFunction(xml:[String:Any])
    {
        let type:String? = xml[kKeyFunctionType] as? String
        
        XCTAssertNotNil(
            type,
            "failed parsing attribute")
        
        let formats:[Any]? = xml[kKeyFormat] as? [Any]
        
        XCTAssertNotNil(
            formats,
            "failed parsing array")
        
        let options:[Any]? = xml[kKeyOption] as? [Any]
        
        XCTAssertNotNil(
            options,
            "failed parsing array")
        
        let firstFormat:[String:Any]? = formats?.first as? [String:Any]
        
        XCTAssertNotNil(
            firstFormat,
            "failed parsing element")
        
        let firstOption:[String:Any]? = options?.first as? [String:Any]
        
        XCTAssertNotNil(
            firstOption,
            "failed parsing element")
        
        checkFormat(xml:firstFormat)
        checkOption(xml:firstOption)
    }
    
    private func checkFormat(xml:[String:Any]?)
    {
        let contentType:String? = xml?[kKeyFormatContentType] as? String
        
        XCTAssertNotNil(
            contentType,
            "failed parsing element")
    }
    
    private func checkOption(xml:[String:Any]?)
    {
        let name:String? = xml?[kKeyOptionName] as? String
        
        XCTAssertNotNil(
            name,
            "failed parsing element")
    }
    
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
            
            guard
            
                let xml:[String:Any] = loadedXml
            
            else
            {
                return
            }
            
            self.checkElements(xml:xml)
        }
    }
}
