import XCTest
import ToDoRedux
@testable import App

class AppSpecs: XCTestCase {
    var app: App!
    let todo = ToDo.test

    override func setUp() {
        app = App()
    }

    func addToDo() {
        app.add(
          todo,
          to: .inbox
        )
    }

    func testAddingToDo() {
        addToDo()

        let todo = app.todos.inbox[0]

        XCTAssertEqual(todo, self.todo)
    }

    func testMarkingToDoAsDone() {
        addToDo()

        let todo = app.todos.inbox[0]

        app.done(todo)

        XCTAssertTrue(app.todos.done.contains(todo))
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
