battery=$(pmset -g batt | grep -Eo "\d+%")
time_left=$(pmset -g batt | (grep -Eo "\d+:+\d+\d" || grep -Eo "\d+\d:+\d+\d"))
echo "Battery at $battery"
echo "Time Left: $time_left"