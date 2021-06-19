read -p "What is the path to terminal-velocity on your device? " working_dir

echo "alias TV=\" cd $working_dir && ./setup.sh\"" >> ~/.bash_profile