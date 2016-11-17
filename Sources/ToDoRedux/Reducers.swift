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
        return state.done(todo)
    case let .move(todo, box):
        return state.move(todo, to: box)
    case let .archive(todo):
        return state.archive(todo)
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

    fileprivate func done(_ todo: ToDo) -> State {
        return .init(
            tags: tags,
            todos: todos.done(todo)
        )
    }

    fileprivate func move(_ todo: ToDo, to box: ToDos.Box) -> State {
        return .init(
            tags: tags,
            todos: todos.move(todo, to: box)
        )
    }

    fileprivate func archive(_ todo: ToDo) -> State {
        return .init(
            tags: tags,
            todos: todos.move(todo, to: .archive)
        )
    }
}

extension ToDos {
    fileprivate func done(_ todo: ToDo) -> ToDos {
        return update(todo) {
            $0.toggleDone()
        }
    }

    fileprivate func move(_ todo: ToDo, to box: ToDos.Box) -> ToDos {
        return update(todo) {
            .init(todo: $0.todo, box: box)
        }
    }

    private func update(_ todo: ToDo, _ update: (ToDos.ToDoInBox) -> ToDos.ToDoInBox) -> ToDos {
        let todos: [ToDos.ToDoInBox] = self.todos.map {
            if $0.todo.id != todo.id {
                return $0
            } else {
                return update($0)
            }
        }

        return .init(todos: todos)
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
