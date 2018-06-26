echo 'finding all subdirs 1gb or bigger...\n\n'
du -k * | awk '$1 > 1000000' | sort -nr
