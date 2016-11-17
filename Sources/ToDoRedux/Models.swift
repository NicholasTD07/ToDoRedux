import Foundation

public typealias Id = UUID
public typealias Date = Foundation.Date

public struct ToDos {
    public static let initial = ToDos.init(todos: [])

    public enum Box {
        case inbox
        case today
        case later
    }

    internal struct ToDoInBox {
        let todo: ToDo
        let box: Box
    }
    internal let todos: [ToDoInBox]

    public var inbox: [ToDo] {
        return todos.filter { $0.in == .inbox }
    }
    public var today: [ToDo] {
        return todos.filter { $0.in == .today }
    }
    public var later: [ToDo] {
        return todos.filter { $0.in == .later }
    }

    public var schedueld: [ToDo] { // has due dates
        return todos.filter { $0.todo.due != nil }
    }
}

public struct Tag {
    public let name: String
}
