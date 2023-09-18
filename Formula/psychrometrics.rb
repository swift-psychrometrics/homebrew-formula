class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.17"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.17"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a9157e90e1a920aa55043b54647cd4f4aa79e3b88d766af938fa4f63bc06cd21"
    sha256 cellar: :any_skip_relocation, monterey:     "e6faf336c8d23d5e29023082513477a518c4af78ee0a42fdef850d123a91ccb9"
    sha256 cellar: :any_skip_relocation, ventura:      "f3c99bcc9feb6e754ce708cf4cf9efd186bb3d43cc3b905e702fd5117fe7d312"
  end

  depends_on xcode: ["14.2", :build]

  def install
    system "make", "install", "PREFIX=#{prefix}"
    generate_completions_from_executable(bin/"psychrometrics", "--generate-completion-script")
  end

  test do
    system "#{bin}/psychrometrics" "--version"
  end
end
