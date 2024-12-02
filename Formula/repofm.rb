class Repofm < Formula
    desc "Repository File Manager - A tool for managing repository files"
    homepage "https://github.com/chenxingqiang/repofm"
    url "https://github.com/chenxingqiang/repofm/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "1cd54e47c6303dd27d68fd72b9b44a2691cad1f0bd2bf1678dea158f5e43b4ff" # 需要替换为实际的SHA256
    license "MIT"
  
    depends_on "node"
  
    def install
      # 首先复制所有文件到 libexec
      libexec.install Dir["*"]
      
      # 在 libexec 目录中执行 npm install
      cd libexec do
        system "npm", "install"
        system "npm", "run", "build"
      end
      
      # 创建 bin 脚本
      (bin/"repofm").write <<~EOS
        #!/bin/bash
        exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli/index.js" "$@"
      EOS
      
      # 设置执行权限
      chmod 0755, bin/"repofm"
    end
  
    test do
      system "#{bin}/repofm", "--version"
    end
  end