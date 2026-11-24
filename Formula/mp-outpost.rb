class MpOutpost < Formula
  desc "Standalone E2EE sidecar CLI, daemon, and MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "8c884c44a1d0df70e8c0b994f6b09c73d693ebde8b35f2309c56136b643b0add"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "f04dac5d3ee500a077815b38378288d1c878b218ac3c3a1d301d86eaf3707dab"
    end
    on_arm do
      url "https://github.com/antimemeai/multiplayer_outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "e016872244f8dc93f952861fc6446ba77bbb847e0a4d8e44d21d70bb95c96cb8"
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
