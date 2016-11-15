import XCTest
import ToDoRedux

class ToDoTests: ToDoReduxTests {
    private var todo: ToDo!

    override func setUp() {
        super.setUp()

        store.dispatch(ToDoActions.add(title: "Buy milk", notes: "", tags: []))
        todo = store.state.todos.first!
    }

    func testAddedToDo() {
        XCTAssertEqual(store.state.todos.count, 1)

        let todo = store.state.todos.first!

        XCTAssertEqual(todo.title, "Buy milk")
        XCTAssertFalse(todo.done)
    }

    func testRemoveToDo() {
        store.dispatch(ToDoActions.remove(todo: todo))

        XCTAssertTrue(store.state.todos.isEmpty)
    }

    func testDoneToDo() {
        store.dispatch(ToDoActions.add(title: "Buy CDs", notes: "", tags: []))
        store.dispatch(ToDoActions.done(todo: self.todo))

        let todo = store.state.todos.first!

        XCTAssertTrue(todo.done)
    }
}
