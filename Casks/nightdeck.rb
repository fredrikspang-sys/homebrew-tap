cask "nightdeck" do
  version "1.1.0"
  sha256 "934cb6e43031e531cdc475a380c28c4be8556459690e42a0ad2784d8fe464b79"

  url "https://github.com/fredrikspang-sys/nightdeck/releases/download/v#{version}/Nightdeck-#{version}-macOS.zip"
  name "Nightdeck"
  desc "BluOS music player"
  homepage "https://github.com/fredrikspang-sys/nightdeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Nightdeck.app"

  zap trash: [
    "~/Library/Application Support/no.spang.nightdeck",
    "~/Library/Caches/no.spang.nightdeck",
    "~/Library/HTTPStorages/no.spang.nightdeck",
    "~/Library/Preferences/no.spang.nightdeck.plist",
    "~/Library/Saved Application State/no.spang.nightdeck.savedState",
  ]

  caveats <<~EOS
    Nightdeck is ad-hoc signed and not notarized, so macOS may block it the first
    time. Right-click Nightdeck.app and choose Open, then confirm. On newer macOS
    versions you may need to allow it under System Settings > Privacy & Security.
    You can also remove the quarantine flag:

      xattr -dr com.apple.quarantine #{appdir}/Nightdeck.app
  EOS
end
