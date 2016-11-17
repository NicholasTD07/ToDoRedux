public struct ToDo {
    internal let id: Id
    public let title: String
    public let done: Bool
    public let due: Date?
    public let notes: String
    public let tags: [Tag]

    public init(
        id: Id = Id(),
        title: String,
        done: Bool = false,
        due: Date?,
        notes: String,
        tags: [Tag]
    ) {
        self.id = id
        self.title = title
        self.done = done
        self.due = due
        self.notes = notes
        self.tags = tags
    }

}
