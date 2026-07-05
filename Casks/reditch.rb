cask "reditch" do
  version "0.1.1"
  sha256 "93108674f352050adf1dd0c8b5b41ea21f845bf16fe373bf58c5fae21acbe0a0"

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

  postflight do
    # Reditch is only ad-hoc signed (no Apple Developer ID / notarization yet),
    # so the quarantine flag Homebrew applies makes Gatekeeper report the app
    # as "damaged" instead of showing the usual unidentified-developer prompt.
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Reditch.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Reditch",
    "~/Library/Preferences/dev.reditch.app.plist",
    "~/Library/Saved Application State/dev.reditch.app.savedState",
  ]
end
