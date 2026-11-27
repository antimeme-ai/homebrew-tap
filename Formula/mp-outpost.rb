class MpOutpost < Formula
  desc "Party sidecar CLI, live chat, MLS E2EE rooms, and 17-tool MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "bfc29c973bddd786859699eceae259e6615e61809376dbebfd0c36c9cbfe9db5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "79bf6b8173fd9b8bf796ed236634a0fca32e1018d9f5a586855b8fecb3453290"
    end
    on_arm do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "d21e00bd370137dfdff46cd787566671a10397802d3a7ff702247da7b5908b1d"
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
