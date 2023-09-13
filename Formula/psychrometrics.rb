class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.11"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "14c70d46d3f554a924c1a1dd04f55727fb915f8a742670372cb208f3afecf006"
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
