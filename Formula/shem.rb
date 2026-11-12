class Shem < Formula
  desc "Run containers and VMs inside a model's weights"
  homepage "https://github.com/JGalego/shem"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.2.0/shem-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6fd4d45efa2d5b9f9777b47f1eca132546decb2265669f26e206b7c1be6df4e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/JGalego/shem/releases/download/v0.2.0/shem-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc51ab799b285077cfbb4dead35e42a0dcd3d344ef57a6fcd12f0ac74c7d0444"
    end
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.2.0/shem-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4cbd67379e1f44b55ac2d76aac735cda7ab8c947e7373209e00e94451a112f9b"
    end
  end

  # Model images and the neural vCPU run on shem-neural, which uv fetches
  depends_on "uv"

  def install
    bin.install "shem"
    bin.install "containerd-shim-shem-v1" if OS.linux?
  end

  test do
    assert_match "shem #{version}", shell_output("#{bin}/shem --version")
  end
end
