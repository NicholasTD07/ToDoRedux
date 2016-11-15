import Foundation

public typealias Id = UUID
public typealias Date = Foundation.Date

public struct ToDos {
    public let inbox: [ToDo] // default
    public let today: [ToDo] // get these done today
    public let later: [ToDo] // no plan for these yet
    public let schedueld: [ToDo] // has due dates
}

public struct Tag {
    public let name: String
}
