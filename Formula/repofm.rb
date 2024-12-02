class Repofm < Formula
    desc "Repository File Manager - A tool for managing repository files"
    homepage "https://github.com/chenxingqiang/repofm"
    url "https://github.com/chenxingqiang/repofm/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "1cd54e47c6303dd27d68fd72b9b44a2691cad1f0bd2bf1678dea158f5e43b4ff" # 需要替换为实际的SHA256
    license "MIT"
  
    depends_on "node"
  
    def install
      system "npm", "install", *Language::Node.std_npm_install_args(libexec)
      bin.install_symlink Dir["#{libexec}/bin/*"]
    end
  
    test do
      system "#{bin}/repofm", "--version"
    end
  end