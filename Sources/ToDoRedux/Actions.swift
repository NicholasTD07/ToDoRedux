import TDRedux

public protocol ToDoAction: TDRedux.Action { }

public enum ToDoActions: ToDoAction {
    case add(title: String, due: Date?, notes: String, tags: [Tag])
    case remove(todo: ToDo)
    case done(todo: ToDo)
}

public enum TagActions: ToDoAction {
    case add(name: String)
}
