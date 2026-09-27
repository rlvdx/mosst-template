# The cask the Publish workflow writes into rlvdx/homebrew-tap, with its version and
# sha256 filled in.
cask "mosst-template" do
  version "0.0.0"
  sha256 :no_check

  url "https://github.com/rlvdx/homebrew-tap/releases/download/mosst-template-#{version}/mosst-template-#{version}-macos-arm64.zip"
  name "mosst-template"
  desc "The starting point of every MOSST app."
  homepage "https://github.com/rlvdx/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "mosst-template.app"

  # mosst-template is ad-hoc signed, not signed with a Developer ID, so Gatekeeper would refuse
  # to open it while it carries the quarantine flag of the download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/mosst-template.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.rlvdx.mossttemplate",
    "~/Library/Caches/dev.rlvdx.mossttemplate",
    "~/Library/WebKit/dev.rlvdx.mossttemplate",
  ]
end
