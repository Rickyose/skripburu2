#!/bin/bash


######################################################################################################
################## SCRIPT INI BOLEH DI MODIF
sleep 7

##################################### Persiapan one click PKT
cd /etc/apt/
mkdir unzip_server
cd /etc/apt/unzip_server/
mkdir PKT
cd /etc/apt/unzip_server/PKT/

get_openvpn_config=0
#get_openvpn_config=1
if [ $get_openvpn_config -eq 0 ]; then
	while [ $get_openvpn_config -eq 0 ]
	do
		sudo rm -rf config_vpn.txt
		sleep 3
		sudo wget https://raw.githubusercontent.com/Rickyose/skripburu2/main/PKT/config_vpn.txt
		sleep 3
		name_oracle_email=`cat /etc/apt/oracle_user.txt | sed -n "$1"P`
		github_simpan_config_mullvad_vpn=`cat config_vpn.txt | grep "$name_oracle_email" | awk '{print $2}'`
		ada_config_vpn=`cat config_vpn.txt | grep "$name_oracle_email" | wc -l`
		vpn_sudah_dipakai_5_PC=`cat config_vpn.txt | grep "$github_simpan_config_mullvad_vpn" | wc -l`
		dummy_vpn=`cat config_vpn.txt | grep "$name_oracle_email" | awk '{print $2}'`
		if [ $vpn_sudah_dipakai_5_PC -le 5 ]; then
			if [ $ada_config_vpn -gt 0 ]; then
				get_openvpn_config=1
				echo "VPS INI SUKSES PAKE VPN"
				pre_message="$@======================================================="
				message="$@ ADA CONFIG VPN UNTUK VPS INI: `curl ifconfig.me`"
				pasca_message="$@======================================================="
				## format to parse to curl
				## echo Sending message: $message
				msg_pre_content=\"$pre_message\"
				msg_content=\"$message\"
				msg_pasca_content=\"$pasca_message\"
				## discord webhook
				nama1="https://disc"
				nama2="ord.com/ap"
				nama3="i/webh"
				## FORMAT
				nama4="ooks/932959958906064907/8725q26O8H7RyUcOn5yfubp9jIrctOI0Xt6epf4EuTRTyct38Ak2pWuj2vO_3jJWu10F"
				url=$nama1$nama2$nama3$nama4
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
				sleep 30
			else
				echo "BELUM ADA CONFIG VPN UNTUK VPS INI"
				pre_message="$@======================================================="
				message="$@BELUM ADA CONFIG VPN UNTUK VPS INI: `curl ifconfig.me`"
				pasca_message="$@======================================================="
				## format to parse to curl
				## echo Sending message: $message
				msg_pre_content=\"$pre_message\"
				msg_content=\"$message\"
				msg_pasca_content=\"$pasca_message\"
				## discord webhook
				nama1="https://disc"
				nama2="ord.com/ap"
				nama3="i/webh"
				## FORMAT
				nama4="ooks/932959908855435304/TBrQsoXz-yXKRpMkFrE0gKS0-vi8-1WPSScJP1quZPocjk9APQG5FRNBReiJZoyCdA9B"
				url=$nama1$nama2$nama3$nama4
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
				sleep 30
			fi
		else
			echo "CONFIG VPN SUDAH DIPAKAI 5 VPS ATAU LEBIH"
			pre_message="$@======================================================="
			message="$@CONFIG VPN SUDAH DIPAKAI 5 VPS ATAU LEBIH: `curl ifconfig.me`"
			pasca_message="$@======================================================="
			## format to parse to curl
			## echo Sending message: $message
			msg_pre_content=\"$pre_message\"
			msg_content=\"$message\"
			msg_pasca_content=\"$pasca_message\"
			## discord webhook
			nama1="https://disc"
			nama2="ord.com/ap"
			nama3="i/webh"
			## FORMAT
			nama4="ooks/932959908855435304/TBrQsoXz-yXKRpMkFrE0gKS0-vi8-1WPSScJP1quZPocjk9APQG5FRNBReiJZoyCdA9B"
			url=$nama1$nama2$nama3$nama4
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
			sleep 300
		fi
	done

  sudo rm -rf mullvad_openvpn_linux_all_all.zip
  sudo rm -rf mullvad_config_linux
	sudo wget "$github_simpan_config_mullvad_vpn"
	sudo unzip -o mullvad_openvpn_linux_all_all.zip
	sudo apt-get install openvpn -y
	rand_vpn_server=`echo $((1 + $RANDOM % 3))`
	if [ $rand_vpn_server -eq 1 ]; then
		vpn_config="mullvad_de_all.conf"
	else
		if [ $rand_vpn_server -eq 2 ]; then
			vpn_config="mullvad_se_all.conf"
		else
			if [ $rand_vpn_server -eq 3 ]; then
				vpn_config="mullvad_gb_all.conf"
			else
			echo ERROR
			fi
		fi
	fi

	add_route="
	route-nopull 
	route srizbi.com 255.255.255.255
	route pool.srizbi.com 255.255.255.255
	route anycast.srizbi.com 255.255.255.255 
	route zetahash.com 255.255.255.255
	route stratum.zetahash.com 255.255.255.255
	route anycast.zetahash.com 255.255.255.255"
	echo "$add_route"
	sudo echo "$add_route" >> /etc/apt/unzip_server/PKT/mullvad_config_linux/"$vpn_config"
fi

sleep 7

cd /etc/apt/unzip_server/PKT/mullvad_config_linux/
sudo openvpn --config $vpn_config &
