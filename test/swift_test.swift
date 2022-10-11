import XCTest
import SwiftParser

final class TestLoad: XCTestCase {
    func testNoThrows() {
        _ = try! Parser.parse(source: "/dev/null")
    }
}

#if os(Linux)
@main
struct MainWrapper {
    static func main() {
        XCTMain([
                testCase([("testNoThrows", TestLoad.testNoThrows)])
        ])
    }
}
#endif
