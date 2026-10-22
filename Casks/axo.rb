# Homebrew cask for Axo. scripts/release.sh fills in 1.0.0 and f37df0e4f0ec18347bebc641d541e6995cdf2aff5475a66784a41603c558992f (build/release/axo.rb).
# scripts/publish.sh copies it to Casks/axo.rb in the tap repo hassanarshad123/homebrew-axo.
# Install: brew install --cask hassanarshad123/axo/axo
cask "axo" do
  version "1.0.0"
  sha256 "f37df0e4f0ec18347bebc641d541e6995cdf2aff5475a66784a41603c558992f"

  url "https://github.com/hassanarshad123/axo/releases/download/v#{version}/Axo.dmg"
  name "Axo"
  desc "Posture and break buddy that lives in the notch"
  homepage "https://axo.zensbot.com/"

  livecheck do
    url "https://axo.zensbot.com/appcast.xml"
    strategy :sparkle, &:short_version # the feed also holds the build number (1.0.0,16)
  end

  auto_updates true
  depends_on macos: :sonoma # minimum macOS 14 (current Homebrew style for ">= :sonoma")

  app "Axo.app"

  zap trash: [
    "~/Library/Application Support/Axo",
    "~/Library/Caches/com.hassanarshad.axo",
    "~/Library/HTTPStorages/com.hassanarshad.axo",
    "~/Library/Preferences/com.hassanarshad.axo.plist",
    "~/Library/Saved Application State/com.hassanarshad.axo.savedState",
  ]
end
