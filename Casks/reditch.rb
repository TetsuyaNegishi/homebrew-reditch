cask "reditch" do
  version "0.1.0"
  sha256 "203861f94e6c00182bdb0ff1a9d32921d8eb5dd22783484e7c77d19141ddd96f"

  url "https://github.com/TetsuyaNegishi/reditch/releases/download/v#{version}/Reditch-#{version}-arm64.dmg"
  name "Reditch"
  desc "Screenshot annotation tool (arrows, text, shapes, mosaic)"
  homepage "https://github.com/TetsuyaNegishi/reditch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Reditch.app"

  zap trash: [
    "~/Library/Application Support/Reditch",
    "~/Library/Preferences/dev.reditch.app.plist",
    "~/Library/Saved Application State/dev.reditch.app.savedState",
  ]
end
