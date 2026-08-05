#!/bin/bash
# Maps a screenshot number (as used in the fastlane image filenames, e.g.
# "6" for phoneScreenshots/6_en-US.png) to its integration test name (e.g.
# "Settings"). Passed through unchanged if it's already a test name.
screenshot_name() {
    case "$1" in
        1) echo "Overview" ;;
        2) echo "AccountDetail" ;;
        3) echo "Activity" ;;
        4) echo "TransactionDetail" ;;
        5) echo "Stats" ;;
        6) echo "Settings" ;;
        *) echo "$1" ;;
    esac
}
