# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.1.4] - 2025-03-28
### Added
- Support for `SYSMON_SOCKET_PATH` environment variable
- Load user-level config from `~/.sysmon/config.json`
- `docs/` directory for project documentation
- Test coverage badge and GitHub Actions build status in README
- Upload automation to PyPI via GitHub Actions using tags

### Fixed
- CLI test coverage issue (invalid command test)
- Config fallback logic (env > local config > user config > default)

---

## [0.1.3] - 2025-03-25
### Added
- Initial PyPI and TestPyPI release
- Daemon process monitoring CPU and memory
- CLI commands: `status`, `metrics`, `shutdown`
- Unix domain socket communication
- Basic test suite with `pytest`, `pytest-cov`
- GitHub Actions workflow to run tests on push and pull requests


