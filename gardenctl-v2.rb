class GardenctlV2 < Formula
  desc "Gardenctl-v2"
  homepage "https://gardener.cloud"
  version "2.0.10-dev"

  depends_on "gardener/tap/gardenlogin"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.0.10-dev/gardenctl_v2_darwin_arm64"
      sha256 "0927b50d35b0cfc9520b0dac11fa9aaca49074520871dfb24581cf25c4e30288"
    else
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.0.10-dev/gardenctl_v2_darwin_amd64"
      sha256 "b9b693e358af99fbdea65116bc5beb4a7871835dc88a3a04ab75fa3c2aa581a7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.0.10-dev/gardenctl_v2_linux_arm64"
      sha256 "aa00ca38bb67e61e67349a2969d05f45e38b826714159f5431add5c3f1ecb1e9"
    else
      url "https://github.com/gardener/gardenctl-v2/releases/download/2.0.10-dev/gardenctl_v2_linux_amd64"
      sha256 "eabee5f2d476d182727153bed361f616cdbaff90746f1ff52f4e3026b44f7f8e"
      depends_on :arch => :x86_64
    end
  end

  def install
    bin.install stable.url.split("/")[-1] => "gardenctl"

    print "\n[HINT]\n"
    print "  Consider to add the gardenctl startup script to your shell profile.\n"
    print "  It contains various tweaks, such as setting environment variables, loading completions and adding some helpful aliases or functions.\n"
    print "  Run `gardenctl rc --help` for more information.\n\n"
  end

  test do
    system "#{bin}/gardenctl", "version"
  end
end

