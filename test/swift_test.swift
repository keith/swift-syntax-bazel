import XCTest
import SwiftParser

final class TestLoad: XCTestCase {
    func testParse() {
        _ = Parser.parse(source: "/dev/null")
    }
}

#if os(Linux)
@main
struct MainWrapper {
    static func main() {
        XCTMain([
                testCase([("testParse", TestLoad.testParse)])
        ])
    }
}
#endif
