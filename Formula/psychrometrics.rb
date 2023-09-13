class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.12"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "838994db810518def228c7becb56feaa41ab9ea5f9a021203df5cf0fe119ac70"
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
