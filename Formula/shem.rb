class Shem < Formula
  desc "Run containers and VMs inside a model's weights"
  homepage "https://github.com/JGalego/shem"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.1.0/shem-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d7d8f8f0561ad8c93285377a8f9215af6c1b8f071170c4f71359cfe478954a69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/JGalego/shem/releases/download/v0.1.0/shem-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ceff2e62c0b1e855bf75bd784fa60845a9b889f0914cf23567adf788b51396b4"
    end
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.1.0/shem-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9a906c524e74d4ff7eadab2de962ad8f8736d817482c6f3c15f5066f73d552d"
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
