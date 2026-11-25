class MpOutpost < Formula
  desc "Party sidecar CLI, live chat, and 14-tool MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "d5e0b9302991e5f34a8e211748cbafbe0cae243a7449c8e8d03433dfb742b041"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "4cb3acbaa7c5e52f576d824130aa4ac6c82116896ce1291d6c95b9e6e865ff37"
    end
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "375e992e386b4b3cc81ae08a1a75c504df7ae441994e0df7343e4f6819abbd72"
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
