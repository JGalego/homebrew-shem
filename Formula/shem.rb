class Shem < Formula
  desc "Run containers and VMs inside a model's weights"
  homepage "https://github.com/JGalego/shem"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.4.0/shem-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "90254e03fb6addc57d02de97ed5a460c8d978a0f715f7d7f2d52f49dbc09103c"
    end
    on_intel do
      url "https://github.com/JGalego/shem/releases/download/v0.4.0/shem-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "604d0ea9219631b0d03f160c7fe1293f4f0b61d0976725e69bc0da6f9a65b358"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/JGalego/shem/releases/download/v0.4.0/shem-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f774aa47fa2b74451a8d79c735e0a81d53e2ecc96a11d6df8a1cfcdf315f3ef2"
    end
    on_arm do
      url "https://github.com/JGalego/shem/releases/download/v0.4.0/shem-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6894cffe196bc3478ad4ddef8a2527b9be044aa3cb816023f437b3b9bd93f65b"
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
