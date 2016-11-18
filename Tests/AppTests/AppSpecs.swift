import struct Foundation.Date
import XCTest
import ToDoRedux
@testable import App

class AppSpecs: XCTestCase {
    var app: App!
    let todo = ToDo.test

    override func setUp() {
        app = App()
    }

    func addTestToInbox() {
        app.add(
          todo,
          to: .inbox
        )
    }

    func testAddingToDo() {
        addTestToInbox()

        let todo = app.todos.inbox[0]

        XCTAssertEqual(todo, self.todo)
    }

    func testAddingToDoToLater() {
        app.add(self.todo, to: .later)

        let todo = app.todos.later[0]

        XCTAssertEqual(todo, self.todo)
    }

    func testAddingToDoWithDue() {
        let todoWithDue = ToDo(
            title: "test",
            due: Date(),
            notes: "",
            tags: []
        )
        app.add(todoWithDue, to: .inbox)

        let todo = app.todos.schedueld[0]

        XCTAssertEqual(todo, todoWithDue)
    }

    func testMarkingToDoAsDone() {
        addTestToInbox()

        let todo = app.todos.inbox[0]

        app.done(todo)

        XCTAssertTrue(app.todos.done.contains(todo))
    }

    func testMovingToDo() {
        addTestToInbox()

        let todo = app.todos.inbox[0]

        app.move(todo, to: .today)

        XCTAssertEqual(app.todos.inbox.count, 0)
        XCTAssertEqual(app.todos.today.count, 1)
        XCTAssertEqual(app.todos.today[0], todo)
    }

    func testArchivingToDo() {
        addTestToInbox()

        let todo = app.todos.inbox[0]

        app.archive(todo)

        XCTAssertEqual(app.todos.inbox.count, 0)
        XCTAssertEqual(app.todos.archive.count, 1)
        XCTAssertEqual(app.todos.archive[0], todo)
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
