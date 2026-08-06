cask "cenno" do
  version "0.4.0"
  sha256 "379257a8b89d953f45d123759bb321252fbe437e46eeca40a7be3423cc954ab3"

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
