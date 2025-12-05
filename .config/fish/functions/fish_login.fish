function fish_login
    if not test -e /tmp/fish_weather
    curl -s 'https://wttr.in/zhengzhou?M&format=%l+%c+%C+%t+%f+%w&lang=zh-cn' > /tmp/fish_weather
    cat /tmp/fish_weather | gawk '{
      city = $1;icon = $2;condition = $3;max_temp = $4;min_temp = $5;wind = $6;
      gsub(/[°C]/, "", max_temp);
      gsub(/[°C]/, "", min_temp);
      gsub(/[m\/s]/, "", wind);
      print "城市:", city;
      print "图标:", icon;
      print "天气:", condition;
      print "气温:", max_temp "°C";
      print "体感温度:", min_temp "°C";
      print "风速:", wind "m/s";
    }'
  end
end
