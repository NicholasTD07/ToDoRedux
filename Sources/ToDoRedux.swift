import TDRedux

public typealias Store = TDRedux.Store<State>

public protocol ToDoAction: TDRedux.Action { }

public struct State {
    public static let initial = State.init(todos: [])

    public let todos: [ToDo]

    public init(todos: [ToDo]) {
        self.todos = todos
    }

    func add(title: String, notes: String) -> State {
        return .init(todos: todos + [.init(title: title, notes: notes)])
    }
}

public enum ToDoActions: ToDoAction {
    case add(title: String, notes: String)
}

public let reducer = Reducer(initialState: State.initial) { (state, action: ToDoActions) in
    switch action {
    case let .add(title, notes):
        return state.add(title: title, notes: notes)
    }
}
