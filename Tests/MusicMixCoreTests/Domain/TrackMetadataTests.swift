import Testing
@testable import MusicMixCore

@Test
func trackMetadataPreservesValidValues() {
    let metadata = TrackMetadata(
        artistName: "Artist",
        albumName: "Album",
        duration: 210
    )

    #expect(metadata.artistName == "Artist")
    #expect(metadata.albumName == "Album")
    #expect(metadata.duration == 210)
}

@Test
func trackMetadataRejectsEmptyNamesAndInvalidDuration() {
    let metadata = TrackMetadata(
        artistName: "   ",
        albumName: "",
        duration: 0
    )

    #expect(metadata.artistName == nil)
    #expect(metadata.albumName == nil)
    #expect(metadata.duration == nil)
}
