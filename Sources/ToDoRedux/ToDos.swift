public struct ToDos {
    public static let initial = ToDos.init(todos: [])

    public enum Box {
        case inbox
        case today
        case later
        case archive
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
    public var archive: [ToDo] {
        return todos
            .filter { $0.box == .archive }
            .map { $0.todo }
    }

    public var all: [ToDo] {
        return todos.map { $0.todo }
    }
    public var done: [ToDo] {
        return all.filter { $0.done }
    }
    public var schedueld: [ToDo] {
        return all.filter { $0.due != nil }
    }
}
