import XCTest
import ToDoRedux

class ToDoTests: ToDoReduxTests {
    private var todo: ToDo!

    override func setUp() {
        super.setUp()

        store.dispatch(ToDoActions.add(todo: ToDo.test, to: .inbox))
        todo = store.state.todos.inbox.first!
    }

    func testAddedToDo() {
        XCTAssertEqual(store.state.todos.all.count, 1)

        let todo = store.state.todos.inbox.first!

        XCTAssertEqual(todo.title, "Buy milk")
        XCTAssertFalse(todo.done)
    }

    func testRemoveToDo() {
        store.dispatch(ToDoActions.remove(todo: todo))

        XCTAssertTrue(store.state.todos.all.isEmpty)
    }

    func testDoneToDo() {
        store.dispatch(ToDoActions.done(todo: self.todo))

        let todo = store.state.todos.all.first!

        XCTAssertTrue(todo.done)
    }
}

extension ToDo {
    static let test = ToDo(
        title: "test",
        due: nil,
        notes: "",
        tags: []
    )
}
