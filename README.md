# CombatState

CombatState is a lightweight World of Warcraft addon that displays a brief, unobtrusive visual indicator when you enter or leave combat — no WeakAuras required.

As the addon ecosystem evolves in *World of Warcraft: Midnight*, CombatState provides a simple, future-proof alternative for tracking combat state using Blizzard’s native API.

---

## Features

- Displays `++Combat` when entering combat
- Displays `--Combat` when leaving combat
- Indicators appear for 3 seconds, then smoothly fade out
- No persistent UI elements
- No configuration required
- No external libraries or dependencies
- Safe to use in combat
- Extremely lightweight and performant

---

## How It Works

CombatState listens to Blizzard’s built-in combat events:

- `PLAYER_REGEN_DISABLED` → Enter combat
- `PLAYER_REGEN_ENABLED` → Leave combat

When either event fires, a temporary on-screen message is shown and then faded out automatically. No polling, no saved variables, and no background processing.

---

## Installation

### Manual Install
1. Download or clone this repository
2. Copy the `CombatState` folder into your WoW AddOns directory: World of Warcraft/_retail/Interface/AddOns/
3. Restart World of Warcraft
4. Enable **CombatState** from the AddOns menu

---

## Configuration

CombatState requires **no configuration**.

The addon is designed to work out of the box with sensible defaults. Advanced configuration may be added in the future, but simplicity and reliability are core design goals.

---

## Compatibility

- World of Warcraft: Retail
- Designed to be compatible with *World of Warcraft: Midnight*
- Uses only Blizzard-supported API events

---

## Performance

CombatState is event-driven and only activates when your combat state changes. It uses no timers, polling, or external libraries, making its performance impact effectively negligible.

---

## Why CombatState?

WeakAuras is powerful, but sometimes overkill for simple tasks. CombatState exists to do one thing well: clearly indicate when your combat state changes — without complexity, overhead, or dependencies.

---

## Roadmap (Possible Enhancements)

- Optional sound cues
- Scale or “pop” animation
- Configurable colors and durations
- Slash command toggles
- Additional state indicators (mounting, stealth, etc.)

---

## License

MIT License.  
Feel free to modify, fork, and redistribute.

---

## Author

Built for players who value clarity, performance, and simplicity.

