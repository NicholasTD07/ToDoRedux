import TDRedux

public protocol ToDoAction: TDRedux.Action { }

public enum ToDoActions: ToDoAction {
    case add(todo: ToDo, to: ToDos.Box)
    case remove(todo: ToDo)
    case done(todo: ToDo)
    case move(todo: ToDo, to: ToDos.Box)
    case archive(todo: ToDo)
}

public enum TagActions: ToDoAction {
    case add(name: String)
}
