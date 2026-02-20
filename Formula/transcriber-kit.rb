class TranscriberKit < Formula
  desc "On-device speech transcription CLI and MCP server using Apple Speech framework"
  homepage "https://github.com/glebis/TranscriberKit"
  url "https://github.com/glebis/TranscriberKit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "295c59301ae03ff2edbe8fc07d30867cf7496b78f97f68b280258ec7ac06b676"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/transcriber"
    bin.install ".build/release/transcriber-mcp"
    share.install "Speech.entitlements" => "transcriber-kit/Speech.entitlements"
  end

  def caveats
    <<~EOS
      To enable microphone access for live transcription, codesign the binaries:

        codesign --force --sign - --entitlements #{share}/transcriber-kit/Speech.entitlements #{bin}/transcriber
        codesign --force --sign - --entitlements #{share}/transcriber-kit/Speech.entitlements #{bin}/transcriber-mcp

      File-based transcription works without codesigning.
    EOS
  end

  test do
    assert_match "USAGE: transcriber", shell_output("#{bin}/transcriber --help 2>&1", 0)
  end
end
