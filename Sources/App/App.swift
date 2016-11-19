import ToDoRedux

internal struct App {
    let store = Store.init(with: ToDoRedux.reducer)
    var todos: ToDos { return store.state.todos }

    func add(_ todo: ToDo, to box: ToDos.Box) {
        store.dispatch(ToDoActions.add(todo: todo, to: box))
    }

    func done(_ todo: ToDo) {
        store.dispatch(ToDoActions.done(todo: todo))
    }

    func move(_ todo: ToDo, to box: ToDos.Box) {
        store.dispatch(ToDoActions.move(todo: todo, to: box))
    }

    func archive(_ todo: ToDo) {
        store.dispatch(ToDoActions.archive(todo: todo))
    }

    func remove(_ todo: ToDo) {
        store.dispatch(ToDoActions.remove(todo: todo))
    }
}
