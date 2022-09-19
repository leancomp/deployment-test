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

search_regex = "$stage-(\w*\.*\-*)*-green"
replacement = "$stage-$release-green"

sed -i "s/$search_regex/$replacement/g" README.md