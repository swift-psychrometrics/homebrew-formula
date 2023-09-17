class Psychrometrics < Formula
  desc "Command-line tool for calculating psychrometric properties"
  homepage "https://github.com/swift-psychrometrics/psychrometrics-cli"
  url "https://github.com/swift-psychrometrics/psychrometrics-cli.git", branch: "main"
  version "0.1.11"
  license "MIT"

  bottle do
    root_url "https://github.com/swift-psychrometrics/psychrometrics-cli/releases/download/0.1.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ed207606373029da6153dd913daa947ba4be0e28ff740771f86a9a5fd020e7f6"
    sha256 cellar: :any_skip_relocation, monterey: "395d588e21ade9d8676345cea67908836183d53d12961f45b86b7c07f19a56e9"
    sha256 cellar: :any_skip_relocation, ventura:      "b2d7306c1ca95ae8b99b2a8af6be2cb49fb65e17ab6476712ac2012ec66efc72"
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
