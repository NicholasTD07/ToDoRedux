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
    case let .add(todo, box):
        return state.add(todo, to: box)
    case let .remove(todo):
        return state.remove(todo: todo)
    case let .done(todo):
        return state.done(todo: todo)
    case let .move(todo, box):
        return state.move(todo, to: box)
    }
}

// MARK: - ToDos related actions

extension ToDos {
    fileprivate func add(_ todo: ToDo, to box: ToDos.Box) -> ToDos {
        return .init(todos: todos + [ToDoInBox.init(todo: todo, box: box)])
    }
}

extension State {
    fileprivate func add(_ todo: ToDo, to box: ToDos.Box) -> State {
        return .init(
            tags: self.tags,
            todos: todos.add(todo, to: box)
        )
    }

    fileprivate func remove(todo: ToDo) -> State {
        return .init(
            tags: tags,
            todos: .init(todos: todos.todos.filter { $0.todo.id != todo.id })
        )
    }

    fileprivate func done(todo: ToDo) -> State {
        let todos: [ToDos.ToDoInBox] = self.todos.todos.map {
            if $0.todo.id != todo.id {
                return $0
            } else {
                return $0.toggleDone()
            }
        }

        return .init(
            tags: tags,
            todos: .init(todos: todos)
        )
    }

    fileprivate func move(_ todo: ToDo, to box: ToDos.Box) -> State {
        let todos: [ToDos.ToDoInBox] = self.todos.todos.map {
            if $0.todo.id != todo.id {
                return $0
            } else {
                print("Move \(todo.title) into \(box)")
                return ToDos.ToDoInBox(todo: todo, box: box)
            }
        }

        return .init(
            tags: tags,
            todos: .init(todos: todos)
        )
    }
}

extension ToDos.ToDoInBox {
    fileprivate func toggleDone() -> ToDos.ToDoInBox {
        return .init(
            todo: todo.toggleDone(),
            box: box
        )
    }
}

extension ToDo {
    fileprivate func toggleDone() -> ToDo {
        return .init(
            id: id,
            title: title,
            done: !done,
            due: due,
            notes: notes,
            tags: tags
        )
    }
}
