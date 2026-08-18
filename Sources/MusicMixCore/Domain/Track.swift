public struct Track: Equatable, Sendable {
    public let id: TrackID
    public let title: String

    public init(id: TrackID, title: String) {
        self.id = id
        self.title = title
    }
}
