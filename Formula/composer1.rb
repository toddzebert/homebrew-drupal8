class Composer1 < Formula
  desc "Dependency Manager for PHP"
  homepage "https://getcomposer.org/"
  # @SEE https://getcomposer.org/download/
  url "https://getcomposer.org/download/1.10.24/composer.phar"
  version "1.10.24"
  sha256 "542ce16add6fd5ecfb0049dd49a0214e69a966a602b42c215adb19438c13a890"
  license "MIT"

  livecheck do
    url "https://github.com/composer/composer.git"
    regex(/^[\d.]+$/i)
  end

  # Calling bottle :unneeded is deprecated! There is no replacement.
  # @SEE https://github.com/Homebrew/brew/pull/11239
  # bottle :unneeded

  def install
    bin.install "composer.phar" => "composer"
  end

  test do
    (testpath/"composer.json").write <<~EOS
      {
        "name": "homebrew/test",
        "authors": [
          {
            "name": "Homebrew"
          }
        ],
        "require": {
          "php": ">=5.3.4"
          },
        "autoload": {
          "psr-0": {
            "HelloWorld": "src/"
          }
        }
      }
    EOS

    (testpath/"src/HelloWorld/greetings.php").write <<~EOS
      <?php

      namespace HelloWorld;

      class Greetings {
        public static function sayHelloWorld() {
          return 'HelloHomebrew';
        }
      }
    EOS

    (testpath/"tests/test.php").write <<~EOS
      <?php

      // Autoload files using the Composer autoloader.
      require_once __DIR__ . '/../vendor/autoload.php';

      use HelloWorld\\Greetings;

      echo Greetings::sayHelloWorld();
    EOS

    system "#{bin}/composer", "install"
    assert_match(/^HelloHomebrew$/, shell_output("php tests/test.php"))
  end
end
