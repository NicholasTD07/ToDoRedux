import TDRedux

public typealias Store = TDRedux.Store<State>

public protocol ToDoAction: TDRedux.Action { }

public struct State {
    public static let initial = State.init(todos: [])

    public let todos: [ToDo]

    public init(todos: [ToDo]) {
        self.todos = todos
    }

    func add(title: String, notes: String, tags: [Tag]) -> State {
        return .init(todos: todos + [.init(title: title, notes: notes, tags: tags)])
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
