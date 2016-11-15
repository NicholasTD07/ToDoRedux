import XCTest
import ToDoRedux

class ToDoTests: ToDoReduxTests {
    override func setUp() {
        super.setUp()

        store.dispatch(ToDoActions.add(title: "Buy milk", notes: "", tags: []))
    }

    func testAddedToDo() {
        XCTAssertEqual(store.state.todos.count, 1)

        let todo = store.state.todos.first!

        XCTAssertEqual(todo.title, "Buy milk")
    }
}
