public struct Track: Equatable, Sendable {
    public let id: TrackID
    public let title: String
    public let metadata: TrackMetadata
    public let audioFeatures: AudioFeatures?

    public init(
        id: TrackID,
        title: String,
        metadata: TrackMetadata = TrackMetadata(),
        audioFeatures: AudioFeatures? = nil
    ) {
        self.id = id
        self.title = title
        self.metadata = metadata
        self.audioFeatures = audioFeatures
    }
}
