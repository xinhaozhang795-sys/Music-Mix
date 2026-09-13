public struct Track: Equatable, Sendable {
    public let id: TrackID
    public let title: String
    public let audioFeatures: AudioFeatures?

    public init(id: TrackID, title: String, audioFeatures: AudioFeatures? = nil) {
        self.id = id
        self.title = title
        self.audioFeatures = audioFeatures
    }
}
