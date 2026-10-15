class ZeColeta < Formula
  desc "Local macOS cleanup and application uninstaller"
  homepage "https://github.com/xenofonteicaro/ze-coleta"
  url "https://github.com/xenofonteicaro/ze-coleta/archive/74109bed5d097f62217bde80f81a5aa75a624411.tar.gz"
  version "0.1.0-alpha.1"
  sha256 "1602b4936b840a0f6fa339edc324bbbb30ccbd5c277d4baebbd0fbbadae36095"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    ENV["COLETA_ARCHS"] = "native"
    ENV["VERSION"] = version.to_s
    # Match Homebrew's macOS std_swift_args inside the outer build sandbox.
    system "bash", "scripts/build-app.sh", "--disable-sandbox"
    prefix.install "build/Zé Coleta.app"
    (bin/"ze-coleta").write <<~SH
      #!/bin/bash
      set -e
      if [ "$#" -gt 0 ]; then
        exec "#{prefix}/Zé Coleta.app/Contents/MacOS/ZeColeta" "$@"
      fi
      exec /usr/bin/open "#{prefix}/Zé Coleta.app"
    SH
    (bin/"ze-coleta").chmod 0755
  end

  def caveats
    <<~EOS
      Run ze-coleta to open Zé Coleta.
      The app is built locally from source; no Developer ID certificate is required.
      Files move to macOS Trash only after you review and confirm your selection.
    EOS
  end

  test do
    assert_match "Zé Coleta #{version}", shell_output("#{bin}/ze-coleta --version")
    assert_path_exists prefix/"Zé Coleta.app/Contents/Info.plist"
  end
end
