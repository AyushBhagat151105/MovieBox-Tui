class MovieboxTui < Formula
  VERSION = "0.1.27"
  MACOS_SHA256 = "7dd6169f389a31afc53ddb8ab7ddfb5cea9f2f6ecd744cdc49baa9857df0a685"
  LINUX_X64_SHA256 = "b4807e0e4531e46378ca07dd01a1c64cdf0ae0cc1c96b42bcc34487853b59383"
  LINUX_ARM64_SHA256 = "e7d903297223cf7e2bb53c2453ad6d68d67e75e1155df5357abe7c108a88dda7"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
