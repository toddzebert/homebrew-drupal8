# Toddzebert Drupal8

While originally intended to support Drupal 8 as various versions formula were remove or deprecated (disabled), it can be used to support what dev situation.

Currently contains these formula:

* Composer v1: for use with Drupal 8 (or whatever). Composer v1 is also used with Drupal 9 although there are ~~workarounds~~ supported ways to use v2.
* PHP v7.4: After homebrew marked it "Deprecated because it is a versioned formula!" AKA disabled.
## How do I install these formulae?
`brew install toddzebert/drupal8/<formula>`

Or `brew tap toddzebert/drupal8` and then `brew install <formula>`.

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

### Updating this formulae.

#### Composer1

1. Find latest composer version 1.x.y from https://github.com/composer/composer/tags and download `composer.phar`
2. Find the sha256 via command like (MacOS) `shasum -a 256 ~/Downloads/composer.phar`
3. edit `composer1.rb`:
- Update version number in `url`, and also `version`
- Update `sha256`

#### PHP7.4
