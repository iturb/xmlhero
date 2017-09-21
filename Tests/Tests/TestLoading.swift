import XCTest
@testable import XmlHero

final class TestLoading:XCTestCase
{
    private let kResourceName:String = "mockElements"
    private let kResourceExtension:String = "xml"
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: tests
    
    func testLoadFile()
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
    
    func testLoadUrl()
    {
        let loadExpectation:XCTestExpectation = expectation(
            description:"load xml")
        
        let bundle:Bundle = Bundle(for:TestLoading.self)
        
        guard
            
            let url:URL = bundle.url(
                forResource:kResourceName,
                withExtension:kResourceExtension)
        
        else
        {
            return
        }
        
        var loadedXml:Any?
        var loadingError:XmlError?
        
        Xml.object(
            url:url)
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
    
    func testLoadData()
    {
        let loadExpectation:XCTestExpectation = expectation(
            description:"load xml")
        
        let bundle:Bundle = Bundle(for:TestLoading.self)
        
        guard
            
            let url:URL = bundle.url(
                forResource:kResourceName,
                withExtension:kResourceExtension)
            
        else
        {
            return
        }
        
        let data:Data
        
        do
        {
            try data = Data(contentsOf:url)
        }
        catch
        {
            return
        }
        
        var loadedXml:Any?
        var loadingError:XmlError?
        
        Xml.object(
            data:data)
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
