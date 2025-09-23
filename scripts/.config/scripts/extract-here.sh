path=$1
directory=$(dirname -- "$path")
filename=$(basename -- "$path")
extension="${filename##*.}"
name="${filename%.*}"

if [ $extension == "zip" ]; then
  unzip $path -d $directory/$name
fi
