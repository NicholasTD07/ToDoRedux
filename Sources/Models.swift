public struct ToDo {
    public let title: String
    public let notes: String

    public init(title: String, notes: String = "") {
        self.title = title
        self.notes = notes
    }
}
