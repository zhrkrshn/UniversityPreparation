# UniversityPrep

> Track your grades, benchmark them against real university program requirements, and know exactly where you stand — all on-device, no account required.

UniversityPrep is a SwiftUI / SwiftData app built for Ontario high school students applying to university or college. It models admissions the way Ontario schools actually calculate them — top six Grade 12 U/M courses — rather than a generic weighted GPA.

---

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Features

- **Grade tracking** — Log Grade 11 and 12 subjects with current scores; GPA recalculates automatically on save.
- **University program benchmarking** — Add programs with minimum and ideal GPA targets and see your standing against each.
- **Prerequisite coverage** — Programs surface which required subjects you're already enrolled in, and which are missing.
- **Offline-first** — All grade data is stored locally via SwiftData. No internet connection required for core functionality.
- **University Search** *(in development)* — Look up a university by name and pull current news and admissions updates from Google Search via a serverless backend.

---

## Requirements

- macOS Sonoma or later
- Xcode 15.0+
- iOS 17.0+ (Simulator or physical device)
- Swift 5.9+

## Installation

I. Download through the App Store.

II. Clone the repository, open it in Xcode, and build.

---

## Roadmap

- [x] Core grade tracking (Grade 11/12 entry, GPA calculation)
- [x] University program benchmarking and prerequisite coverage
- [ ] University Search (serverless backend + caching) — *in progress*
- [ ] Admission cycle calendar (OUAC deadlines)

See open [Issues](../../issues) for granular tracking.

---

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

Please open an issue first for non-trivial changes so the approach can be discussed before implementation. Bug reports should include steps to reproduce, iOS version, and device/simulator used.

## License

Distributed under the MIT License.

## Contact

Project Link: [https://github.com/zhrkrshn/UniversityPreparation](https://github.com/zhrkrshn/UniversityPreparation)
