# typed: true
# frozen_string_literal: true

# GardenctlV2 is a formula for installing Gardenctl-v2
class GardenctlV2 < Formula
  desc "Command-line tool for managing Gardener clusters"
  homepage "https://gardener.cloud"
  version "2.0.9-dev"

  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.0.9-dev/gardenctl_v2_darwin_arm64"
      sha256 "601ba84c624a08361afe7d2177e95b0d53cb4ed28db7a58eacdbf1f8b72adabd"
    else
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.0.9-dev/gardenctl_v2_darwin_amd64"
      sha256 "e6522252f362a4195a93897ec94ff274d3ae146bd5c8e9c08ad205846b84e1e7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.0.9-dev/gardenctl_v2_linux_arm64"
      sha256 "4426cf4af19f587e516c18c625b2104d29b37bb219c4fafe270e1cd4f8a040b0"
    else
      url "https://github.com/petersutter/gardenctl-v2/releases/download/v2.0.9-dev/gardenctl_v2_linux_amd64"
      sha256 "313dd56fd38b1ddc4ae851c2c9fafc66d516cbc6e34e5162671b06d85b1da37c"
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
