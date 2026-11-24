class Blackbird < Formula
  desc "Native C++23 and Lua coding harness and multi-agent Command Post"
  homepage "https://github.com/antimemeai/blackbird"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "55abac5e8b164e1ee813cb50c713dcfa0c89deca443ceffd0acdf1e94d0f0acd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-x86_64.tar.gz"
      sha256 "d4b7a9189195510ac676f00b535f7e2aad93f988cee972aced6793ce7b9e5f8b"
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
