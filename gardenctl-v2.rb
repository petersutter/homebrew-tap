# typed: true
# frozen_string_literal: true

# GardenctlV2 is a formula for installing Gardenctl-v2
class GardenctlV2 < Formula
  desc "Command-line tool for managing Gardener clusters"
  homepage "https://gardener.cloud"
  version "2.9.0-dev"

  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.9.0-dev/gardenctl_v2_darwin_arm64"
      sha256 "a106e570e87605ddf1b038bcc8754e644ee82d783f5910a946d2f739d504e093"
    else
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.9.0-dev/gardenctl_v2_darwin_amd64"
      sha256 "204353108097df297764e13d1ddeada4fbb53f6dc0b79b7261e016618292e5be"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.9.0-dev/gardenctl_v2_linux_arm64"
      sha256 "c4e302b62012e72956acfada69b8a0aea494d4103979f1306feafd092d077434"
    else
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.9.0-dev/gardenctl_v2_linux_amd64"
      sha256 "170d0ffec8d5795a8624090fb2e482fe7279caacff311ca42ac12bdbe745aca2"
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
