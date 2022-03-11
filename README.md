# Toddzebert Drupal8

While originally intended to support Drupal 8 as various versions formula were remove or deprecated (disabled), it can be used to support what dev situation.

Currently contains these formula:

* Composer v1: for use with Drupal 8 (or whatever). Composer v1 is also used with Drupal 9 although there are ~~workarounds~~ supported ways to use v2.
* *(broken, see #1 and #2)* PHP v7.4: After homebrew marked php@74  "Deprecated because it is a versioned formula!" AKA disabled.

1. The PHP recipe references a manifest JSON file, that has some sort of security on it against, presumable, cross-site references. Attempting to install this formula will result in a the following issue, despite the php@74 formula actually downloading it.
> Downloading https://ghcr.io/v2/homebrew/core/php74/manifests/7.4.28_1
> curl: (22) The requested URL returned error: 404
Although it turns out homebrew caches stuff, on a Mac it's at:
`/Users/{user-dir}/Library/Caches/Homebrew/downloads/`

2. Once again that original formula seems to be working, also this comment is helpful https://stackoverflow.com/questions/64684713/update-php-to-7-4-macos-catalina-with-brew
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
