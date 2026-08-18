# Music-Mix

Music-Mix is a clean-room rebuild of an Apple Music smart queue system.

The project is developed incrementally. Each stage must have a clear architectural boundary, tests, and a verified CI result before the next stage begins.

## Current stage

**Phase 0 — Foundation**

The current implementation contains only the minimal Swift package and core domain foundation. Queue, transition intelligence, MusicKit integration, playback, and learning are intentionally not implemented yet.

See `DEVELOPMENT.md` for the project development rules.
