function _peco_change_directory
    if [ (count $argv) ]
        peco --layout=bottom-up --query "$argv " | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    else
        peco --layout=bottom-up | perl -pe 's/([ ()])/\\\\$1/g' | read foo
    end
    if [ $foo ]
        builtin cd $foo
    else
        commandline ''
    end
end

function peco_change_directory
    begin
        echo $Home/.config
        ghq list -p
        ls -ad */ | perl -pe "s#^#$PWD/#" | grep -v \.git
        ls -ad ~/randebu/Developments/*/* | grep -v \.git
    end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
