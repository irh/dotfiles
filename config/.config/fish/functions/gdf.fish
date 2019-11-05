# Defined in - @ line 1
function gdf --description 'alias gdf git diff --ignore-submodules'
	git diff --ignore-submodules $argv;
end
