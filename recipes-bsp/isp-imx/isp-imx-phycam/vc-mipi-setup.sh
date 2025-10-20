#!/bin/sh

usage() {
    echo "Usage: $0 [options]"
    echo ""
    echo "Setup default ISP tuning files."
    echo "                                                                      "
    echo "Supported actions:                                                    "
    echo " create <w> <h>           Creates or recreates tuning files           "
    echo " init                     Creates tuning files for the detected cam   "
    echo " restart                  Restarts service                            "
    echo "                                                                      "
    echo "Supported action parameters:                                          "
    echo "  <w> <h>                 Image width and height                      "
    echo "                                                                      "
    echo "Supported options:                                                    "
    echo "    --help                Show this help text                         "
    echo "-f, --force               Forces the creation of the tuning files     "
    echo "-s, --service             Set if calling from start_isp_sh            "
}

restart_service() {
	return
}

while [ $# != 0 ] ; do
	option="$1"
	shift

	case "${option}" in
    setup-c0)
		isp-mode-select-csi1 -W "${1}" -H "${2}"
        shift
        shift
        ;;
    setup-c1)
		isp-mode-select-csi2 -W "${1}" -H "${2}"
        shift
        shift
        ;;
    -f|--force)
        ;;
    --help)
		usage
		exit 0
		;;
    init)
		isp-mode-select-csi1
		isp-mode-select-csi2
        ;;
    restart)
        restart_service
        ;;
    -s|--service)
        ;;
	*)
		echo "Unknown option ${option}"
		exit 1
		;;
	esac
done
