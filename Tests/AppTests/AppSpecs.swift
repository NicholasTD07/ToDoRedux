import XCTest
import ToDoRedux
@testable import App

class AppSpecs: XCTestCase {
    var app: App!

    override func setUp() {
        app = App()
    }

    func addToDo() {
        app.todos.add(
          ToDo.test,
          to: .inbox
        )
    }

    func testAddingToDo() {
        addToDo()

        let todo = app.todos.inbox[0]

        // expect todo == ToDo.test
    }

    func testMarkingToDoAsDone() {
        addToDo()

        let todo = app.todos.inbox[0]

        app.todos.done(todo)

        // expect app.todos.done.contains(todo)
    }
}
