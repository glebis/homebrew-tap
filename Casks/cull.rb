cask "cull" do
  version "0.6.2"
  sha256 "4962ba84bab0c211ce29e3229d5e06fec9248fc74795696b92cd94b7b3d10456"

  url "https://github.com/glebis/cull/releases/download/v#{version}/Cull_#{version}_aarch64.dmg"
  name "Cull"
  desc "Local-first image review and curation tool for large image sets"
  homepage "https://github.com/glebis/cull"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Cull.app"

  zap trash: [
    "~/Library/Application Support/com.glebkalinin.cull",
    "~/Library/Caches/com.glebkalinin.cull",
    "~/Library/Preferences/com.glebkalinin.cull.plist",
    "~/Library/Saved Application State/com.glebkalinin.cull.savedState",
    "~/Library/WebKit/com.glebkalinin.cull",
  ]
end
