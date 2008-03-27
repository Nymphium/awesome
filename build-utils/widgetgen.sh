#!/bin/sh
top_srcdir="${1-.}"
echo "/* This file is autogenerated by" $(basename $0) "*/"
echo
echo "const name_func_link_t WidgetList[] ="
echo "{"
for file in ${top_srcdir}/widget.h
do
    echo "    /* $file */"
    grep '^WidgetConstructor ' "$file" | cut -d' ' -f2 | cut -d\; -f1 | while read widget
    do
        shortname=$(echo $widget | cut -d_ -f1)
        echo "    {\"$shortname\", $widget},"
    done
done

echo "    {NULL, NULL}"
echo "};"
