public struct TrackMetadata: Equatable, Sendable {
    public let artistName: String?
    public let albumName: String?
    public let duration: TimeInterval?

    public init(
        artistName: String? = nil,
        albumName: String? = nil,
        duration: TimeInterval? = nil
    ) {
        self.artistName = Self.nonEmpty(artistName)
        self.albumName = Self.nonEmpty(albumName)
        self.duration = Self.validDuration(duration)
    }

    private static func nonEmpty(_ value: String?) -> String? {
        guard let value, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return nil
        }
        return value
    }

    private static func validDuration(_ value: TimeInterval?) -> TimeInterval? {
        guard let value, value.isFinite, value > 0 else { return nil }
        return value
    }
}
