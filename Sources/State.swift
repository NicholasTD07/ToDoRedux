import TDRedux

public typealias Store = TDRedux.Store<State>

public struct State {
    public static let initial = State.init(tags: [], todos: .initial)

    public let tags: [Tag]
    public let todos: ToDos

    public init(tags: [Tag], todos: ToDos) {
        self.tags = tags
        self.todos = todos
    }
}
