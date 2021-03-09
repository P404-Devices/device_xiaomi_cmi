#! /vendor/bin/sh

# Copyright (c) 2021 The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials provided
#      with the distribution.
#    * Neither the name of The Linux Foundation nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

###############################################################################################
# This script is used to read the SKU info from the Qualcomm Technologies, Inc Gen-3 SOC's.   #
# Please folow the below procedure to read the SKU info.                                      #
# adb root                                                                                    #
# adb disable-verity                                                                          #
# adb reboot                                                                                  #
# adb root                                                                                    #
# adb remount                                                                                 #
# adb push sku-info.sh /vendor/bin                                                            #
# adb shell                                                                                   #
# cd /vendor/bin                                                                              #
# ./sku-info.sh                                                                               #
# The output will be printed on the console for example: Qualcomm Technologies, Inc SA8155P   #
###############################################################################################


#Read the soc_id
if [ -f /sys/devices/soc0/soc_id ]; then
    soc_id=`cat /sys/devices/soc0/soc_id`
else
    soc_id=`cat /sys/devices/system/soc/soc0/id`
fi

# Print SKU info for SA8155P
# SA8155P soc_id = 367
# SA8155 soc_id = 362

case "$soc_id" in
          "362" | "367" )
        if [ -f /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem ]; then
		#read feature id from nvram
		reg_val=`cat /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem | od -An -t d4`
		feature_id=$(((reg_val >> 20) & 0xFF))
		if [ $feature_id == 0 ]; then
			 echo "Qualcomm Technologies, Inc SA8155P"
		elif [ $feature_id == 1 ]; then
				 echo "Qualcomm Technologies, Inc SA8150P"
		else
				 echo "Qualcomm Technologies, Inc Unknown SKU"
		fi
	else
		echo "qfprom node for reading the sku info is not available"
	fi

  ;;
esac


# Print SKU info for SA6155P
# SA6155P soc_id = 377
# SA6155 soc_id = 384

case "$soc_id" in
          "377" | "384" )
	if [ -f /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem ]; then
		#read feature id from nvram
		reg_val=`cat /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem | od -An -t d4`
		feature_id=$(((reg_val >> 20) & 0xFF))
		if [ $feature_id == 7 ]; then
			 echo "Qualcomm Technologies, Inc SA4150P"
		elif [ $feature_id == 6 ]; then
				 echo "Qualcomm Technologies, Inc SA6145P"
		elif [ $feature_id == 5 ]; then
				 echo "Qualcomm Technologies, Inc SA6150P"
			elif [ $feature_id == 4 ] || [ $feature_id == 3 ]; then
				 echo "Qualcomm Technologies, Inc SA6155P"
		else
				 echo "Qualcomm Technologies, Inc Unknown SKU"
		fi
	else
		echo "qfprom node for reading the sku info is not available"
	fi
   ;;
esac


# Print SKU info for SA8195P
# SA8195P soc_id = 405

case "$soc_id" in
          "405" )
	if [ -f /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem ]; then
		#read feature id from nvram
		reg_val=`cat /sys/devices/platform/soc/780130.qfprom/qfprom0/nvmem | od -An -t d4`
		feature_id=$(((reg_val >> 20) & 0xFF))
		if [ $feature_id == 0 ]; then
			 echo "Qualcomm Technologies, Inc SA8185P"
			elif [ $feature_id == 1 ] || [ $feature_id == 2 ]; then
				 echo "Qualcomm Technologies, Inc SA8195P"
		elif [ $feature_id == 3 ]; then
				 echo "Qualcomm Technologies, Inc SA8195-AC"
		else
				 echo "Qualcomm Technologies, Inc Unknown SKU"
		fi
	else
		echo "qfprom node for reading the sku info is not available"
	fi
  ;;
esac
