import XCTest
import SwiftParser

final class TestLoad: XCTestCase {
    func testParse() {
        _ = Parser.parse(source: "/dev/null")
    }
}
