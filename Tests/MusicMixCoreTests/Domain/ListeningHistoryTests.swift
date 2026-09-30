import Foundation
import Testing
@testable import MusicMixCore

@Test
func listeningHistoryKeepsEventsInChronologicalOrder() {
    let early = Date(timeIntervalSince1970: 100)
    let late = Date(timeIntervalSince1970: 200)

    let first = ListeningEvent(
        trackID: TrackID(rawValue: "b"),
        timestamp: late,
        kind: .stopped,
        elapsedTime: 30
    )
    let second = ListeningEvent(
        trackID: TrackID(rawValue: "a"),
        timestamp: early,
        kind: .started,
        elapsedTime: 0
    )

    let history = ListeningHistory(events: [first, second])

    #expect(history.events == [second, first])
    #expect(history.count == 2)
    #expect(!history.isEmpty)
}

@Test
func listeningHistoryReturnsEventsForTrack() {
    let timestamp = Date(timeIntervalSince1970: 100)
    let target = TrackID(rawValue: "target")

    let matching = ListeningEvent(
        trackID: target,
        timestamp: timestamp,
        kind: .started,
        elapsedTime: 0
    )
    let other = ListeningEvent(
        trackID: TrackID(rawValue: "other"),
        timestamp: timestamp.addingTimeInterval(1),
        kind: .started,
        elapsedTime: 0
    )

    let history = ListeningHistory(events: [other, matching])

    #expect(history.events(for: target) == [matching])
}

@Test
func emptyListeningHistoryIsRepresentedExplicitly() {
    let history = ListeningHistory()

    #expect(history.isEmpty)
    #expect(history.count == 0)
    #expect(history.events.isEmpty)
}
