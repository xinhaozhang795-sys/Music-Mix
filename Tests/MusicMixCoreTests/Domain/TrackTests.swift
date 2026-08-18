import Testing
@testable import MusicMixCore

@Test
func trackPreservesIdentityAndTitle() {
    let id = TrackID(rawValue: "track-1")
    let track = Track(id: id, title: "Example")

    #expect(track.id == id)
    #expect(track.title == "Example")
}
