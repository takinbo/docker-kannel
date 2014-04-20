function install {
    FILE=`mktemp`
    wget --no-check-certificate "$2" -O $FILE
    if [ `md5sum $FILE | cut -f 1 -d " "` == $1 ]; then
        sudo dpkg -i $FILE
        rm $FILE
        return 0
    else
        rm $FILE
        return 1
    fi
}

install "0107ded062da180638cc438f77ee7879" "https://redmine.kannel.org/attachments/download/221/kannel_1.5.0-0_amd64.deb" &&
install "a97d3927f9f1535a81f3166050cc8a26" "https://redmine.kannel.org/attachments/download/226/kannel-extras_1.5.0-0_amd64.deb"
