cask "cenno" do
  version "0.1.0"
  sha256 "6d536709a1632f0bef6c41404fe38ac38b5c9a878b03de213c35980214050608"

  url "https://github.com/glebis/cenno/releases/download/v#{version}/cenno_#{version}_aarch64.dmg"
  name "cenno"
  desc "Minimal floating panels that let MCP agents ask you questions"
  homepage "https://github.com/glebis/cenno"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey
  depends_on arch: :arm64

  app "cenno.app"

  uninstall launchctl: "cenno"

  zap trash: [
    "~/Library/Application Support/app.cenno",
    "~/Library/Caches/app.cenno",
    "~/Library/Preferences/app.cenno.plist",
    "~/Library/WebKit/app.cenno",
  ]
end
