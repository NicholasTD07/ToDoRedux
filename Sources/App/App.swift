import ToDoRedux

internal struct App {
    struct ToDos {
        enum Box {
            case inbox
        }

        func add(_ todo: ToDo, to box: Box) {
        }

        func done(_ todo: ToDo) {
        }
    }

    let todos = ToDos()
}
