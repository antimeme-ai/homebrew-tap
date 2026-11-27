class MpOutpost < Formula
  desc "Party sidecar CLI, live chat, and 14-tool MCP server for multiplayer.tech"
  homepage "https://multiplayer.tech"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-darwin-arm64.tar.gz"
      sha256 "54b1e157b70e0f526f954da71c86fc3914a6024aa02391ce3512a375d484517e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-x86_64.tar.gz"
      sha256 "f30ee45f0810145c1f72d45eca083f28ef258758c5cfb7ab2ca68d15b32cd6df"
    end
    on_arm do
      url "https://github.com/antimeme-ai/outpost/releases/download/v#{version}/mp-outpost-v#{version}-linux-arm64.tar.gz"
      sha256 "3681c6aa9f9e95835e3f14256dd525696b4e16758208e449626b443f3e77f831"
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
