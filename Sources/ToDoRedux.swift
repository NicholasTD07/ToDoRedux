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

    func add(title: String, notes: String, tags: [Tag]) -> State {
        return .init(
            tags: self.tags,
            todos: todos + [.init(title: title, notes: notes, tags: tags)]
        )
    }
}

public enum ToDoActions: ToDoAction {
    case add(title: String, notes: String, tags: [Tag])
}

public let reducer = Reducer(initialState: State.initial) { (state, action: ToDoActions) in
    switch action {
    case let .add(title, notes, tags):
        return state.add(title: title, notes: notes, tags: tags)
    }
}
