cask "cull" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.4"
  sha256 :no_check

  url "https://github.com/glebis/cull/releases/download/v#{version}/Cull_#{version}_#{arch}.dmg"
  name "Cull"
  desc "Local-first image review and curation tool for large image sets"
  homepage "https://github.com/glebis/cull"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Cull.app"

  zap trash: [
    "~/Library/Application Support/com.glebkalinin.cull",
    "~/Library/Caches/com.glebkalinin.cull",
    "~/Library/Preferences/com.glebkalinin.cull.plist",
    "~/Library/Saved Application State/com.glebkalinin.cull.savedState",
    "~/Library/WebKit/com.glebkalinin.cull",
  ]
end
