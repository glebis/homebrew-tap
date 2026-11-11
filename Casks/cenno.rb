cask "cenno" do
  version "0.6.0"
  sha256 "4ed6736e76b69ce92d5881872c464a7ef7a4a4d89a0a92e34e81a8fa628757b7"

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
