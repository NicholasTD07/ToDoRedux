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
}

extension ToDos {
    public var inbox: [ToDo] {
        return todos
            .filter { $0.box == .inbox }
            .map { $0.todo }
    }
    public var today: [ToDo] {
        return todos
            .filter { $0.box == .today }
            .map { $0.todo }
    }
    public var later: [ToDo] {
        return todos
            .filter { $0.box == .later }
            .map { $0.todo }
    }

    public var schedueld: [ToDo] {
        return todos
            .filter { $0.todo.due != nil }
            .map { $0.todo }
    }

    public var all: [ToDo] {
        return todos.map { $0.todo }
    }
}

public struct Tag {
    public let name: String
}
