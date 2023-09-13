class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.12"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c996c59d85eee3b2ed7f5f0984b4e0b6ef165800f6197787f7ef3d3fb4690788"
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
