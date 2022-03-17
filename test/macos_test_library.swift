import XCTest
import SwiftSyntaxParser

final class TestLoad: XCTestCase {
    func testNoThrows() {
        _ = try! SyntaxParser.parse(source: "/dev/null")
    }
}
