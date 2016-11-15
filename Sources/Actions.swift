import TDRedux

public protocol ToDoAction: TDRedux.Action { }

public enum ToDoActions: ToDoAction {
    case add(title: String, notes: String, tags: [Tag])
    case remove(todo: ToDo)
}

public enum TagActions: ToDoAction {
    case add(name: String)
}
