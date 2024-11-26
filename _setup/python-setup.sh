if [[ "$OSTYPE" == "darwin"* ]]; then
  curl -sL https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh > /tmp/miniconda-setup.sh
  sh /tmp/miniconda-setup.sh -b -p $HOME/.miniconda3
fi

$HOME/.miniconda3/bin/conda install \
  ipykernel \
  python-lsp-server \
  pytorch \
  torchaudio \
  torchvision \
  -c pytorch-nightly \
  -c conda-forge \
  -y
