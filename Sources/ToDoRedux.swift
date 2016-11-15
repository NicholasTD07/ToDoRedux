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

// MARK: - ToDos related actions
extension State {
    fileprivate func addToDo(title: String, notes: String, tags: [Tag]) -> State {
        return .init(
            tags: self.tags,
            todos: todos + [.init(title: title, notes: notes, tags: tags)]
        )
    }

    fileprivate func remove(todo: ToDo) -> State {
        return .init(
            tags: tags,
            todos: todos.filter { $0.id != todo.id }
        )
    }
}


// MARK: - Tags related actions
extension State {
    fileprivate func addTag(name: String) -> State {
        return .init(
            tags: tags + [.init(name: name)],
            todos: todos
        )
    }
}

public enum ToDoActions: ToDoAction {
    case add(title: String, notes: String, tags: [Tag])
    case remove(todo: ToDo)
}

public enum TagActions: ToDoAction {
    case add(name: String)
}

public let reducer = TDRedux.combine(reducers: [
    tagReducer,
    todoReducer,
])

public let tagReducer = Reducer(initialState: State.initial) { (state, action: TagActions) in
    switch action {
    case let .add(name):
        return state.addTag(name: name)
    }
}

public let todoReducer = Reducer(initialState: State.initial) { (state, action: ToDoActions) in
    switch action {
    case let .add(title, notes, tags):
        return state.addToDo(title: title, notes: notes, tags: tags)
    case let .remove(todo):
        return state.remove(todo: todo)
    }
}
