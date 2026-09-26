import Foundation

public struct ListeningEvent: Equatable, Sendable {
    public enum Kind: Equatable, Sendable {
        case started
        case paused
        case resumed
        case stopped
    }

    public let trackID: TrackID
    public let timestamp: Date
    public let kind: Kind
    public let elapsedTime: TimeInterval
    public let duration: TimeInterval?

    public init(
        trackID: TrackID,
        timestamp: Date,
        kind: Kind,
        elapsedTime: TimeInterval,
        duration: TimeInterval? = nil
    ) {
        self.trackID = trackID
        self.timestamp = timestamp
        self.kind = kind
        self.elapsedTime = max(0, elapsedTime)
        self.duration = Self.validDuration(duration)
    }

    public var progress: Double? {
        guard let duration, duration > 0 else {
            return nil
        }

        return min(max(elapsedTime / duration, 0), 1)
    }

    private static func validDuration(_ value: TimeInterval?) -> TimeInterval? {
        guard let value, value.isFinite, value > 0 else {
            return nil
        }

        return value
    }
}
