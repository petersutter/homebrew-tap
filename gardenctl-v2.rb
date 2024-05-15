# typed: true
# frozen_string_literal: true

# GardenctlV2 is a formula for installing Gardenctl-v2
class GardenctlV2 < Formula
  desc "Command-line tool for managing Gardener clusters"
  homepage "https://gardener.cloud"
  version "2.9.0-dev1"

  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.9.0-dev1/gardenctl_v2_darwin_arm64"
      sha256 "bbc0d98835c3b16143340dd1cfdf772167af5bca89f92a1323f480e38376ff52"
    else
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.9.0-dev1/gardenctl_v2_darwin_amd64"
      sha256 "b478a3ec0cbb385d730da293dbd76cecd4ae9b04ad02ad855d4ab952de5b7f7b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.9.0-dev1/gardenctl_v2_linux_arm64"
      sha256 "82b74a3ff296b967be38cd2c8a6d7155bad920d64309b20656719b1eb1498fdc"
    else
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.9.0-dev1/gardenctl_v2_linux_amd64"
      sha256 "9ece5e6fd40592ee566dfc6750f9006abadfa29da94a1f28a6d7a71c91a7f46c"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenctl"

    print "\n[HINT]\n"
    print "  Consider to add the gardenctl startup script to your shell profile.\n"
    print "  It contains various tweaks, such as setting environment variables,\n"
    print "  loading completions and adding some helpful aliases or functions.\n"
    print "  Run `gardenctl rc --help` for more information.\n\n"
  end

  test do
    system "#{bin}/gardenctl", "version"
  end
end
