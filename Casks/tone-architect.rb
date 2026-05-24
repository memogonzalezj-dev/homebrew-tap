cask "tone-architect" do
  version "1.1.0"
  sha256 "b8ed98eb06d22a8e0dd9f53ecaa8ba7eda62a7443d545fae5c509a95606f1885"

  url "https://github.com/memogonzalezj-dev/ToneArchitect/releases/download/v#{version}/Tone.Architect-#{version}-arm64.dmg"
  name "Tone Architect"
  desc "AI-powered guitar preset generator for Line 6 HX devices"
  homepage "https://github.com/memogonzalezj-dev/ToneArchitect"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Tone Architect.app"

  # App is unsigned — remove quarantine so macOS doesn't block launch
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Tone Architect.app"]
  end

  zap trash: [
    "~/Library/Application Support/tone-architect",
  ]

  caveats <<~EOS
    Tone Architect requires Apple Silicon (M1 or later).
    On first launch, the app will download the AI model (~5 GB).
    Make sure you have enough disk space before starting.
  EOS
end
