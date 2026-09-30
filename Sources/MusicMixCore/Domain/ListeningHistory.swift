import Foundation

public struct ListeningHistory: Equatable, Sendable {
    public let events: [ListeningEvent]

    public init(events: [ListeningEvent] = []) {
        self.events = events.sorted { lhs, rhs in
            if lhs.timestamp != rhs.timestamp {
                return lhs.timestamp < rhs.timestamp
            }
            return lhs.trackID.rawValue < rhs.trackID.rawValue
        }
    }

    public var isEmpty: Bool {
        events.isEmpty
    }

    public var count: Int {
        events.count
    }

    public func events(for trackID: TrackID) -> [ListeningEvent] {
        events.filter { $0.trackID == trackID }
    }
}
