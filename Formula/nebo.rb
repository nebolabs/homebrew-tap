# Homebrew formula for Nebo
# To install: brew install nebolabs/tap/nebo
# Or: brew tap nebolabs/tap && brew install nebo

class Nebo < Formula
  desc "AI agent with web UI - your personal AI companion"
  homepage "https://github.com/nebolabs/nebo"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nebolabs/nebo/releases/download/v#{version}/nebo-darwin-arm64"
      sha256 "bac66ff12574e3a6f99a93a69018e1b4596b98ae4bd0fc43c62d522cb7cfd6ce"

      def install
        bin.install "nebo-darwin-arm64" => "nebo"
      end
    end

    on_intel do
      url "https://github.com/nebolabs/nebo/releases/download/v#{version}/nebo-darwin-amd64"
      sha256 "6d0e93536537f571d25d4beec56b618ba81c5352f3e4a69fa94574c62d25d71e"

      def install
        bin.install "nebo-darwin-amd64" => "nebo"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nebolabs/nebo/releases/download/v#{version}/nebo-linux-arm64"
      sha256 "87e174211abf2b3615f90ab25900adc1b24eb6f45dc56922dce1cc5d7fd11bfd"

      def install
        bin.install "nebo-linux-arm64" => "nebo"
      end
    end

    on_intel do
      url "https://github.com/nebolabs/nebo/releases/download/v#{version}/nebo-linux-amd64"
      sha256 "3cfc1bbdc6242094d3cd7ca6c85a55ee3e8c504d0bb587149c3f2700f8a15147"

      def install
        bin.install "nebo-linux-amd64" => "nebo"
      end
    end
  end

  def caveats
    <<~EOS
      Nebo installed successfully!

      To start Nebo:
        nebo

      Then open http://localhost:27895 in your browser.

      First time setup:
        1. Go to http://localhost:27895/setup
        2. Create your admin account
        3. Add API keys in Settings > Providers

      Data is stored in platform-standard locations:
        macOS:  ~/Library/Application Support/Nebo/
        Linux:  ~/.config/nebo/
    EOS
  end

  test do
    assert_match "nebo", shell_output("#{bin}/nebo --help")
  end
end
