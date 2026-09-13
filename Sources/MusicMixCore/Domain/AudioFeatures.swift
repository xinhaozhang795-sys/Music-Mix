public struct AudioFeatures: Equatable, Sendable {
    public let bpm: Double?
    public let energy: Double?
    public let danceability: Double?
    public let valence: Double?
    public let acousticness: Double?
    public let instrumentalness: Double?

    public init(
        bpm: Double? = nil,
        energy: Double? = nil,
        danceability: Double? = nil,
        valence: Double? = nil,
        acousticness: Double? = nil,
        instrumentalness: Double? = nil
    ) {
        self.bpm = Self.valid(bpm, range: 20...300)
        self.energy = Self.normalized(energy)
        self.danceability = Self.normalized(danceability)
        self.valence = Self.normalized(valence)
        self.acousticness = Self.normalized(acousticness)
        self.instrumentalness = Self.normalized(instrumentalness)
    }

    private static func normalized(_ value: Double?) -> Double? {
        guard let value, value.isFinite else { return nil }
        return min(1, max(0, value))
    }

    private static func valid(_ value: Double?, range: ClosedRange<Double>) -> Double? {
        guard let value, value.isFinite, range.contains(value) else { return nil }
        return value
    }
}
