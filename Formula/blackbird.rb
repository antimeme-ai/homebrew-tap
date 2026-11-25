class Blackbird < Formula
  desc "Native C++23 and Lua coding harness and multi-agent Command Post"
  homepage "https://github.com/antimemeai/blackbird"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "a5cb14f24677dfd2f246f49cd20720b3f914e9417f9156d6a5272065411cd363"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-x86_64.tar.gz"
      sha256 "a10442b77279b4cbde1206a1e4942681c16f95a9caa29d7c72f4ddbb505b473b"
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
