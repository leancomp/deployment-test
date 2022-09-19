#!/usr/bin/env bash
while getopts s:r: flag
do
    case "${flag}" in
        s) stage=${OPTARG};;
        r) release=${OPTARG};;
    esac
done

echo "Stage: $stage";
echo "Release: $release";

search_regex="$stage-(\w*\.*\-*)*-green"
replacement="$stage-$release-green"

echo $search_regex
echo $replacement

sed -i -e "s/$search_regex/$replacement/g" README.md
