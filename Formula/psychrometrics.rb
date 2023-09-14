class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.1"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.1" sha256 cellar: :any_skip_relocation, monterey: "5081e3f689c8cefc168a79d9c97759502e68330ae020eee66ccd67e3a0dfd03f"
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.1"
    sha256 cellar: :any_skip_relocation, ventura: "f4db51dd207b5a1368432ba3ce11cac410a66a77e0679a88ebb7a0a3098f1621"
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
