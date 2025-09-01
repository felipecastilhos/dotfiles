# Conda lazy loading
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

_load_conda() {
  if [[ -z "$CONDA_LOADED" && -f /opt/miniconda3/etc/profile.d/conda.sh ]]; then
    source /opt/miniconda3/etc/profile.d/conda.sh
    export CONDA_LOADED=1
  fi
}

# Wrapper function that triggers lazy loading
conda() {
  _load_conda
  command conda "$@"
}

python() {
  if [[ -z "$CONDA_DEFAULT_ENV" ]]; then
    _load_conda
  fi
  command python "$@"
}
