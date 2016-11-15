import TDRedux

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

// MARK: - Tags related actions
extension State {
    fileprivate func addTag(name: String) -> State {
        return .init(
            tags: tags + [.init(name: name)],
            todos: todos
        )
    }
}

public let todoReducer = Reducer(initialState: State.initial) { (state, action: ToDoActions) in
    switch action {
    case let .add(title, notes, tags):
        return state.addToDo(title: title, notes: notes, tags: tags)
    case let .remove(todo):
        return state.remove(todo: todo)
    case let .done(todo):
        return state.done(todo: todo)
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

    fileprivate func done(todo: ToDo) -> State {
        return .init(
            tags: tags,
            todos: todos.map {
                if $0.id != todo.id {
                    return $0
                } else {
                    return $0.toggleDone()
                }
            }
        )
    }
}
