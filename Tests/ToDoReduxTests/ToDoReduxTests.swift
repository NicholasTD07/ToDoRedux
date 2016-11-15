import XCTest
@testable import ToDoRedux

class ToDoReduxTests: XCTestCase {
    var store: ToDoRedux.Store!

    override func setUp() {
        store = Store.init(with: ToDoRedux.reducer)
    }

    func testInitialState() {
        XCTAssertTrue(store.state.todos.isEmpty)
    }

    func testAddToDo() {
        store.dispatch(ToDoActions.add(title: "Buy milk"))

        XCTAssertEqual(store.state.todos.count, 1)

        let todo = store.state.todos.first!

        XCTAssertEqual(todo.title, "Buy milk")
    }


    /**
        This seems unnecessary.
        Without this, swift test can find the tests above.

    static var allTests : [(String, (ToDoReduxTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
    */
}
