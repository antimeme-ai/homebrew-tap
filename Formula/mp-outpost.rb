class MpOutpost < Formula
  desc "Standalone E2EE sidecar CLI, daemon, and MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "bef0c38bd4edba76c250de914eedb39a8fcf43705266394e27c4afabb3f74649"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "84c24a2cb54851434e2e243d15f65bcc769493298707022584e10888e0326d2f"
    end
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "4f9a3a1b322d07bcf6f20c0f50c690d9b9221f2f23f865782570378c8eae8f39"
    end
  end

  def install
    bin.install "mp-outpost"
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mp-outpost --version")
  end
end
