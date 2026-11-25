class Blackbird < Formula
  desc "Native C++23 and Lua coding harness and multi-agent Command Post"
  homepage "https://github.com/antimemeai/blackbird"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "554f7d07d2992d478d7cbe782587d64d5db850ccc0446a33680a1f79a3842289"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-x86_64.tar.gz"
      sha256 "c9d4acfdf9c9242282c13f5dc1b5c0d85e1ad58f3b3435f2ab9a48392c564d52"
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
