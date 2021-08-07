if not functions -q omf; 
    if not test -d ~/.local/share/oh-my-fish
        pushd ~/.local/share
        git clone https://github.com/oh-my-fish/oh-my-fish
        pushd oh-my-fish
        bin/install --offline
        popd
        popd
    end 
end

# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
