cask "cenno" do
  version "0.5.0"
  sha256 "8dcb3eb67480a847d28d019ee70183d94b70f1598d1bbf27d8e22e420e41b3c1"

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
