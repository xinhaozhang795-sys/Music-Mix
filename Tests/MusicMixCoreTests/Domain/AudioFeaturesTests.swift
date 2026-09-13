import XCTest
@testable import MusicMixCore

final class AudioFeaturesTests: XCTestCase {
    func testNormalizedFeaturesAreClamped() {
        let features = AudioFeatures(energy: 1.5, danceability: -0.5, valence: 0.4)

        XCTAssertEqual(features.energy, 1)
        XCTAssertEqual(features.danceability, 0)
        XCTAssertEqual(features.valence, 0.4)
    }

    func testInvalidBPMBecomesUnavailable() {
        XCTAssertNil(AudioFeatures(bpm: 0).bpm)
        XCTAssertNil(AudioFeatures(bpm: 301).bpm)
        XCTAssertEqual(AudioFeatures(bpm: 128).bpm, 128)
    }

    func testNonFiniteValuesBecomeUnavailable() {
        let features = AudioFeatures(bpm: .infinity, energy: .nan, valence: .infinity)

        XCTAssertNil(features.bpm)
        XCTAssertNil(features.energy)
        XCTAssertNil(features.valence)
    }
}
