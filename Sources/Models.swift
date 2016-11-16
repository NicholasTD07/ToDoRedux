import Foundation

public typealias Id = UUID
public typealias Date = Foundation.Date

public struct ToDos {
    public static let initial = ToDos.init(inbox: [], today: [], later: [])

    public enum Box {
        case inbox
        case today
        case later
    }

    public let inbox: [ToDo] // default
    public let today: [ToDo] // get these done today
    public let later: [ToDo] // no plan for these yet

    public var all: [ToDo] {
        return inbox + today + later
    }
    public var schedueld: [ToDo] { // has due dates
        return all.filter { $0.due != nil }
    }
}

public struct Tag {
    public let name: String
}
