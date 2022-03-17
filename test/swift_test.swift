import XCTest
import SwiftSyntaxParser

final class TestLoad: XCTestCase {
    func testNoThrows() {
        _ = try! SyntaxParser.parse(source: "/dev/null")
    }
}

#if os(Linux)
XCTMain([
    testCase([("testNoThrows", TestLoad.testNoThrows)])
])
#endif
