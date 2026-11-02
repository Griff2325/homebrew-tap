cask "pihole-bar" do
  version "1.0.0"
  sha256 "90dee1ade46cd412a046c069f7141fa73649b0e73a23e881ee532dc61700e130"

  url "https://github.com/Griff2325/pihole-menubar/releases/download/v#{version}/PiHoleBar-#{version}.zip"
  name "PiHoleBar"
  desc "Menu bar monitor for Pi-hole v6"
  homepage "https://github.com/Griff2325/pihole-menubar"

  depends_on macos: ">= :ventura"

  app "PiHoleBar.app"

  # The app is not notarized, so clear the download quarantine flag.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/PiHoleBar.app"]
  end

  zap trash: "~/Library/Preferences/PiHoleBar.plist"
end
