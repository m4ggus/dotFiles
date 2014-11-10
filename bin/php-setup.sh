#!/usr/bin/env bash

ARGS="$@"

function getAvailablePhpVersions()
{
	curl -s http://de2.php.net/downloads.php \
	| grep -P '<a href=".*">.+?.tar.bz2' \
	| sed -e 's/.*\<a href\="[^\php-]*\(.*\)/\1/g' -e 's/\.tar.bz2.*//g'
}

function printAvailablePhpVersions()
{
	local versions=$(getAvailablePhpVersions)
	for version in $versions; do
		echo "$version";
	done;
}

function parseCommandArguments()
{
	local OPTIND opt val args;

	while getopts "::lh" opt; do
		case "${opt}" in
			l)
				printAvailablePhpVersions;
				exit 0
				;;
			h)
				echo "h triggered without arg = ${OPTARG}"
				;;
			*)
				echo "${opt} = ${OPTARG}"
				;;
		esac
	done
	shift $((OPTIND-1))

	echo $*
}

function main()
{

	parseCommandArguments $ARGS
}

main
