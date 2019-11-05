# Defined in - @ line 1
function gsmu --description 'alias gsmu git submodule update --init --recursive'
	git submodule update --init --recursive $argv;
end
