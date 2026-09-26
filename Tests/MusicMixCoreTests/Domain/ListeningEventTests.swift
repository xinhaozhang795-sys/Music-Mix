import Foundation
import Testing
@testable import MusicMixCore

@Test
func listeningEventPreservesPlaybackFacts() {
    let trackID = TrackID(rawValue: "track-1")
    let timestamp = Date(timeIntervalSince1970: 1_000)
    let event = ListeningEvent(
        trackID: trackID,
        timestamp: timestamp,
        kind: .started,
        elapsedTime: 30,
        duration: 120
    )

    #expect(event.trackID == trackID)
    #expect(event.timestamp == timestamp)
    #expect(event.kind == .started)
    #expect(event.elapsedTime == 30)
    #expect(event.duration == 120)
    #expect(event.progress == 0.25)
}

@Test
func listeningEventNormalizesInvalidTimingValues() {
    let event = ListeningEvent(
        trackID: TrackID(rawValue: "track-2"),
        timestamp: Date(),
        kind: .stopped,
        elapsedTime: -10,
        duration: 0
    )

    #expect(event.elapsedTime == 0)
    #expect(event.duration == nil)
    #expect(event.progress == nil)
}

@Test
func listeningEventClampsProgressToPlaybackRange() {
    let event = ListeningEvent(
        trackID: TrackID(rawValue: "track-3"),
        timestamp: Date(),
        kind: .stopped,
        elapsedTime: 150,
        duration: 120
    )

    #expect(event.progress == 1)
}
