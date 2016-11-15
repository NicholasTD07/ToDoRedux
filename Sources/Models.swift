import Foundation

public typealias Id = UUID

public struct Tag {
    public let id: Id
    public let name: String

    public init(name: String) {
        self.name = name

        self.id = Id()
    }
}


public struct ToDo {
    public let title: String
    public let notes: String
    public let tags: [Tag]

    public init(title: String, notes: String, tags: [Tag]) {
        self.title = title
        self.notes = notes
        self.tags = tags
    }
}