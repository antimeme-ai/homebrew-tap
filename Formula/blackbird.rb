class Blackbird < Formula
  desc "Native C++23 and Lua coding harness and multi-agent Command Post"
  homepage "https://github.com/antimemeai/blackbird"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "246f52dd2edc825f31464672af7481d23b27506ae5ba34316f187ca33aa00e9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-x86_64.tar.gz"
      sha256 "c3678e1b5beada0f67e1db2fd39af1de79fd6026c7142882312144d8ee0c09e4"
    end
  end

  def install
    # Keep the full relocatable release tree intact inside libexec so
    # $ORIGIN/../lib RPATH on Linux and share/blackbird/{programs,assets,profiles}
    # resolve relative to libexec/bin/blackbird without polluting HOMEBREW_PREFIX.
    libexec.install Dir["*"]

    (bin/"blackbird").write <<~SH
      #!/bin/sh
      set -eu
      export BLACKBIRD_SPRITE_ASSET="${BLACKBIRD_SPRITE_ASSET:-#{libexec}/share/blackbird/assets/sr71.png}"
      exec "#{libexec}/scripts/blackbird" "$@"
    SH
    chmod 0755, bin/"blackbird"
  end

  test do
    assert_match "blackbird ", shell_output("#{bin}/blackbird --version")
    assert_path_exists libexec/"share/blackbird/assets/sr71.png"
    assert_path_exists libexec/"share/blackbird/programs/turn.lua"
  end
end
