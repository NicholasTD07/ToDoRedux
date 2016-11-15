import TDRedux

public typealias Store = TDRedux.Store<State>

public protocol ToDoAction: TDRedux.Action { }

public struct State {
    public static let initial = State.init(tags: [], todos: [])

    public let tags: [Tag]
    public let todos: [ToDo]

    public init(tags: [Tag], todos: [ToDo]) {
        self.tags = tags
        self.todos = todos
    }
}

public enum ToDoActions: ToDoAction {
    case add(title: String, notes: String, tags: [Tag])
    case remove(todo: ToDo)
}

public enum TagActions: ToDoAction {
    case add(name: String)
}
