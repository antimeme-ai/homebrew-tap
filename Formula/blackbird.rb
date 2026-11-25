class Blackbird < Formula
  desc "Native C++23 and Lua coding harness and multi-agent Command Post"
  homepage "https://github.com/antimemeai/blackbird"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "c8c64206b704db7f3a2173cc8aae695bbfc2940040dc257868ca327fb6b916fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-x86_64.tar.gz"
      sha256 "e71abda55ca7e90a0f5a46a3fcb8fe9c37c71b33ed0422e59a4cb05ac6863988"
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
