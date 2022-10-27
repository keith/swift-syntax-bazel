import XCTest
import SwiftParser

final class TestLoad: XCTestCase {
    func testNoThrows() {
        _ = try! Parser.parse(source: "/dev/null")
    }
}
