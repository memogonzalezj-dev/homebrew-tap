cask "tone-architect" do
  version "1.5.0"
  sha256 "e8576a43acca4da39a76d21fe5bbabe9bfc6cf484649bb6294839b24dc4849f7"

  url "https://github.com/memogonzalezj-dev/ToneArchitect/releases/download/v#{version}/Tone.Architect-#{version}-arm64.dmg"
  name "Tone Architect"
  desc "AI-powered guitar preset generator for Line 6 HX devices"
  homepage "https://github.com/memogonzalezj-dev/ToneArchitect"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Tone Architect.app"

  zap trash: ["~/Library/Application Support/tone-architect"]

  caveats <<~EOS
    Tone Architect requires Apple Silicon (M1 or later).
    On first launch, the app will download the AI model (~5 GB).
    Make sure you have enough disk space before starting.
  EOS
end
