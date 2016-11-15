import Foundation

public typealias Id = UUID

public struct Tag {
    public let name: String

    public init(name: String) {
        self.name = name
    }
}


public struct ToDo {
    internal let id: Id
    public let done: Bool
    public let title: String
    public let notes: String
    public let tags: [Tag]

    public init(
        id: Id = Id(), done: Bool = false,
        title: String, notes: String, tags: [Tag]
    ) {
        self.id = id
        self.done = done
        self.title = title
        self.notes = notes
        self.tags = tags
    }

    public func toggleDone() -> ToDo {
        return .init(
            id: id,
            done: !done,
            title: title,
            notes: notes,
            tags: tags
        )
    }
}
