import XCTest
@testable import Coex

final class CoexDispatchQueueTests: XCTestCase {
    
    let timeDelay = 0.3
    let timeMargin = 0.2
    
    // MARK: - dispatch queue tests
    
    func testAsyncMainDefault() {
        let expectation = self.expectation(description: "Expected on main queue called by default parameters")
        var calledStuffAfterSinceAsync = false
        
        async {
            #if targetEnvironment(simulator)
            XCTAssert(Thread.isMainThread, "Should be on main thread (simulator)")
            #else
            XCTAssertEqual(qos_class_self(), qos_class_main())
            #endif
            XCTAssert(calledStuffAfterSinceAsync, "Should be async")
            expectation.fulfill()
        }
        
        calledStuffAfterSinceAsync = true
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncMain() {
        let expectation = self.expectation(description: "Expected on main queue")
        var calledStuffAfterSinceAsync = false
        
        async(.main) {
            #if targetEnvironment(simulator)
            XCTAssert(Thread.isMainThread, "Should be on main thread (simulator)")
            #else
            XCTAssertEqual(qos_class_self(), qos_class_main())
            #endif
            XCTAssert(calledStuffAfterSinceAsync, "Should be async")
            expectation.fulfill()
        }
        
        calledStuffAfterSinceAsync = true
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncUtility() {
        let expectation = self.expectation(description: "Expected on utility queue")
        
        async(.utility) {
            XCTAssertEqual(qos_class_self(), DispatchQoS.QoSClass.utility.rawValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncBackground() {
        let expectation = self.expectation(description: "Expected on background queue")
        
        async(.background) {
            XCTAssertEqual(qos_class_self(), DispatchQoS.QoSClass.background.rawValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncUserInteractive() {
        let expectation = self.expectation(description: "Expected on user interactive queue")
        
        async(.userInteractive) {
            XCTAssertEqual(qos_class_self(), DispatchQoS.QoSClass.userInteractive.rawValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncUserInitiated() {
        let expectation = self.expectation(description: "Expected on user initiated queue")
        
        async(.userInitiated) {
            XCTAssertEqual(qos_class_self(), DispatchQoS.QoSClass.userInitiated.rawValue)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncCustomQueueConcurrent() {
        let expectation = self.expectation(description: "Expected custom queue")
        let label = "CustomQueueLabel"
        let customQueue = DispatchQueue(label: label, attributes: [.concurrent])
        let key = DispatchSpecificKey<String>()
        customQueue.setSpecific(key: key, value: label)
        
        async(.custom(queue: customQueue)) {
            XCTAssertEqual(DispatchQueue.getSpecific(key: key), label)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
    
    func testAsyncCustomQueueSerial() {
        let expectation = self.expectation(description: "Expected custom queue")
        let label = "CustomQueueLabel"
        let customQueue = DispatchQueue(label: label, attributes: [])
        let key = DispatchSpecificKey<String>()
        customQueue.setSpecific(key: key, value: label)
        
        async(.custom(queue: customQueue)) {
            XCTAssertEqual(DispatchQueue.getSpecific(key: key), label)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeMargin, handler: nil)
    }
   
    static var allTests = [
        ("testAsyncMainDefault", testAsyncMainDefault),
        ("testAsyncMain", testAsyncMain),
        ("testAsyncUtility", testAsyncUtility),
        ("testAsyncBackground", testAsyncBackground),
        ("testAsyncUserInteractive", testAsyncUserInteractive),
        ("testAsyncUserInitiated", testAsyncUserInitiated),
        ("testAsyncCustomQueueConcurrent", testAsyncCustomQueueConcurrent),
        ("testAsyncCustomQueueSerial", testAsyncCustomQueueSerial)
    ]
}
