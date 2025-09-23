#!/bin/sh

mkdir $1/$2
touch $1/$2/$2.tsx
touch $1/$2/$2.module.scss
echo -e "import styles from \"./$2.module.scss\";\n\nexport default function $2() {\n  return (\n    <div>\n    </div>\n  );\n}\n" > $1/$2/$2.tsx
