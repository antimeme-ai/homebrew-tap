class MpOutpost < Formula
  desc "Party sidecar CLI, live chat, and 13-tool MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "18b2813785d0a0fc1df9cf41ccb6dbe8f704c4e6033fcabc29f54c67f15c5b97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "d4af1836422e0dda193c655f0d655a04937cc1546236f8a97afcb44c0bd2612f"
    end
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "f85d4b5d6e1e80dfe3a3d3f5036172c1d62bcd06eb3c5cc2ffc4bdbb9957c4df"
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
