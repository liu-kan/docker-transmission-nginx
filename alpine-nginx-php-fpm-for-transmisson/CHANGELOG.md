# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) 
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [v1.3.1] - 2016-12-04
### Changed
- Use ```#``` as the sed delimiter to avoid conflict with folder path environment variables
- Exclude the ```vendor``` folder when templating variables

## [v1.3.0] - 2016-11-26
### Changed
- Bumped up PHP version to 7.0.13
- Php-fpm now logs to stdout / stderr

### Fixed
- Logging to stdout and stderr for nginx and php-fpm

## [v1.2.0] - 2016-10-08
### Changed
- Bump PHP version to 7.0.11

### Added
- Support for inclusion of custom supervisord config files

## [v1.1.0] - 2016-07-20
### Changed
- Bump PHP version to 7.0.8

## [v1.0.0] - 2016-06-12
### Added
- Initial tag

[Unreleased]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/compare/v1.3.1...master
[v1.3.1]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/compare/v1.3.0...v1.3.1
[v1.3.0]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/compare/v1.2.0...v1.3.0
[v1.2.0]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/compare/v1.1.0...v1.2.0
[v1.1.0]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/compare/v1.0.0...v1.1.0
[v1.0.0]: https://gitlab.com/boxedcode/alpine-nginx-php-fpm/tags/v1.0.0