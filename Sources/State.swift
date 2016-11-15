import TDRedux

public typealias Store = TDRedux.Store<State>

public struct State {
    public static let initial = State.init(tags: [], todos: [])

    public let tags: [Tag]
    public let todos: [ToDo]

    public init(tags: [Tag], todos: [ToDo]) {
        self.tags = tags
        self.todos = todos
    }
}
