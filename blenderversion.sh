lines=`wc -l blender_versions.txt | head -c 1`

cat -n blender_versions.txt | sed -nr 's/\s*([0-9]+).*(blender-[0-9]+\.[0-9]+\.[0-9]+).*/\1 - \2/ p'
echo "Which version would you like to use?"
read ver

case $ver in
[1-$lines])
  sed -n "$ver w sel.xyz" blender_versions.txt
  sed -r 's/^/        <path>/ ; s/(\.exe)/\1<\/path>/ ' sel.xyz > sel.xzz
  sed -r -e "/blender\.exe/c REPLACE_THIS" PenTablet_Config.pcfg > testcfg
  sed "/REPLACE_THIS/r sel.xzz" testcfg | sed "/REPLACE_THIS/d" > PenTablet_Config.pcfg
  rm testcfg sel.xyz sel.xzz blender_versions.txt;;
*)
  echo "you chose wrong";;
esac