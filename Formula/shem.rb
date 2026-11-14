class Shem < Formula
  desc "Run containers and VMs inside a model's weights"
  homepage "https://github.com/JGalego/shem"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.3.0/shem-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "abb480320e1855c5308f41d55d1b148b7968938ee1fb5eaabc2e6e2948fc076f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/JGalego/shem/releases/download/v0.3.0/shem-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7861280e80e73cac79623a0bfe6f9babb9f43b544bba66d931d6395a718fc9d5"
    end
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.3.0/shem-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85dec4de555f805e8946eb0645551ca64ca99f70dba29886f1f4119135244a28"
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
